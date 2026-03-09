return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    -- render_modes = { "n", "v", "V", "i", "t", "c" },
    render_modes = true,
    win_options = {
      conceallevel = {
        rendered = 0,
        default = 1,
      },
    },
    code = {
      conceal_delimiters = false,
      language_border = "▄",
      language_left = "▟",
      language_right = "▙",
      border = "thin",
    },
    heading = {
      -- icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      border = true,
      border_virtual = true,
    },
    checkbox = {
      enabled = true,
      bullet = true,
    },
  },
}
