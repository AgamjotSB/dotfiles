-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.o.termguicolors = true
vim.opt.linebreak = true
vim.o.wrap = true
vim.o.breakindent = true
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"
-- vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_eslint_auto_format = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
