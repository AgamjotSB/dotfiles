-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function runInterpreter(interpreter, file_name)
  vim.fn.system(
    'kitty -T nvimexec sh -c "' .. interpreter .. " '" .. file_name .. "'; read -p 'Press Enter to exit...'\""
  )
end

local function runCompiler(compiler, file_name)
  local executable_name = vim.fn.expand("%:p:r")
  local compile_command = compiler .. " -Wall -O2 -g '" .. file_name .. "' -o '" .. executable_name .. ".out'"
  vim.fn.system(compile_command)
  if vim.v.shell_error == 0 then
    executable_name = executable_name .. ".out"
    vim.fn.system("kitty -T nvimexec sh -c \"'" .. executable_name .. "';read -p 'Press Enter to exit...'\"")
    vim.fn.system('rm -f "' .. executable_name .. '"')
  else
    print(vim.v.shell_error)
  end
end

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w")
  local file_extension = vim.fn.expand("%:e")
  local file_name = vim.fn.expand("%:p")
  if file_extension == "cpp" then
    runCompiler("g++", file_name)
  elseif file_extension == "c" then
    runCompiler("gcc", file_name)
  elseif file_extension == "java" then
    runInterpreter("java", file_name)
  elseif file_extension == "py" then
    runInterpreter("python3", file_name)
  elseif file_extension == "js" then
    runInterpreter("node", file_name)
  elseif file_extension == "go" then
    runInterpreter("go run", file_name)
  elseif file_extension == "php" then
    runInterpreter("php", file_name)
  end
end, { desc = "Run Single File" })
