return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>gf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	---@module "conform"
	---@type conform.setupOpts
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			lua = { "stylua" },
			java = { "clang-format" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			typescript = { "prettier", "prettier", stop_after_first = true },
			python = { "black" },
		},
		formatters = {
			prettierd = {
				env = {
					PRETTIERD_DEFAULT_CONFIG = "/home/agamjotsb/.config/nvim/.prettierrc.json",
				},
			},
		},
	},
}
