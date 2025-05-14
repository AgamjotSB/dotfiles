-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>r", function()
  vim.cmd("w")
  local file_extension = vim.fn.expand("%:e")
  local file_name = vim.fn.expand("%:p")
  if file_extension == "cpp" then
    local executable_name = vim.fn.expand("%:p:r")
    local compilecommand = "g++ -Wall -O2 -g '" .. file_name .. "' -o '" .. executable_name .. ".out'"
    vim.fn.system(compilecommand)
    if vim.v.shell_error == 0 then
      executable_name = executable_name .. ".out"

      -- runs the exec in a floating kitty terminal
      vim.fn.system("kitty -T nvimexec sh -c \"'" .. executable_name .. "';read -p 'Press Enter to exit ...'\"")

      vim.fn.system('rm -f "' .. executable_name .. '"')
    else
      print(vim.v.shell_error)
    end
  elseif file_extension == "java" then
    vim.fn.system("kitty -T nvimexec sh -c \"java '" .. vim.fn.expand("%:p") .. "'; read -p 'Press Enter to exit...'\"")
  elseif file_extension == "py" then
    vim.fn.system("kitty -T nvimexec sh -c 'python3 \"" .. file_name .. '"; read -p "Press Enter" \' ')
  end
end, { desc = "Run" })
