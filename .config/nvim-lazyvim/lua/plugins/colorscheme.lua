return {
  {
    "catppuccin/nvim",
    opts = {
      -- flavour = "mocha",
      transparent_background = true,
      float = {
        transparent = true,
      },
    },
  },

  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
    },
  },

  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      style = "night",
    },
  },

  {
    "flazz/vim-colorschemes", -- tty themes from vim
  },

  { "LazyVim/LazyVim", opts = {
    colorscheme = "catppuccin-mocha",
  } },
}
