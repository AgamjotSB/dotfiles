vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", --latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("setoptions")
require("compile_run_delete")

--primeagen move entire line up or down (alt shift up/down in vsc)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

-- lsp maps?
vim.keymap.set("n", "<C-d>", vim.lsp.buf.hover, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})

-- none-ls/null-ls maps
-- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

--primagen remaplua stolen
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>p", [["+p]])

vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "gj", "j")
vim.keymap.set("n", "gk", "k")
