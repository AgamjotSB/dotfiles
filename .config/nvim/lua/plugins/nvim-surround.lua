return {
    "kylechui/nvim-surround",
    version = "*", --stable branch
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end,
}
