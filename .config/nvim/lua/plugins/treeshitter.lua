return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			auto_install = true,
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"html",
				"java",
				"javascript",
				"lua",
				"luadoc",
				"markdown",
				"typescript",
			},
			ignore_install = {},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			modules = {},
			--[[ incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<M-space>",
				},
			}, --]]
		})
	end,
}
