return {
  "nmac427/guess-indent.nvim",
  config = function()
    require("guess-indent").setup({
      -- auto_cmd = true,
      -- override_editorconfig = false,
      -- filetype_exclude = {
      --   "netrw",
      -- },
      -- on_space_options = {
      --   ["expandtab"] = true,
      --   ["tabstop"] = "detected", -- If the option value is 'detected', The value is set to the automatically detected indent size.
      --   ["softtabstop"] = "detected",
      --   ["shiftwidth"] = "detected",
      -- },
    })
  end,
}
