-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function runInterpreter(interpreter, file_path)
  local safe_path = vim.fn.shellescape(file_path)
  local bash_cmd = string.format('%s %s; read -p "Press Enter to exit..."', interpreter, safe_path)
  vim.system({
    "kitty",
    "-T",
    "nvimexec",
    "bash",
    "-c",
    bash_cmd,
  }, { detach = true })
end

local function runCompiler(compiler, file_path)
  local file_root = vim.fn.expand("%:p:r")
  local out_file = file_root .. ".out"
  local safe_out_file = vim.fn.shellescape(out_file)
  local compile_cmd = { compiler, "-Wall", "-O2", "-g", file_path, "-o", out_file }
  vim.notify("Compiling " .. vim.fn.expand("%:t") .. "...", vim.log.levels.INFO, { title = "Quick Run" })
  vim.system(compile_cmd, { text = true }, function(out)
    if out.code == 0 then
      local bash_cmd = string.format('%s; rm -f %s; read -p "Press Enter to exit..."', safe_out_file, safe_out_file)
      vim.system({
        "kitty",
        "-T",
        "nvimexec",
        "bash",
        "-c",
        bash_cmd,
      }, { detach = true })
    else
      vim.schedule(function()
        vim.notify("Compilation failed:\n" .. (out.stderr or out.stdout), vim.log.levels.ERROR, { title = "Quick Run" })
      end)
    end
  end)
end

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("silent! w")
  local file_extension = vim.fn.expand("%:e")
  local file_path = vim.fn.expand("%:p")

  local compilers = {
    cpp = "g++",
    c = "gcc",
  }

  local interpreters = {
    java = "java",
    py = "python3",
    js = "node",
    ts = "npx tsx",
    go = "go run",
    php = "php",
    sh = "bash",
  }

  if compilers[file_extension] then
    runCompiler(compilers[file_extension], file_path)
  elseif interpreters[file_extension] then
    runInterpreter(interpreters[file_extension], file_path)
  else
    vim.notify("No runner configured for extension: " .. file_extension, vim.log.levels.ERROR, { title = "Quick Run" })
  end
end, { desc = "Run Single File" })
