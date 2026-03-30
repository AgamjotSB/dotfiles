return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        ty = {
          init_options = {},
          settings = {
            ty = {
              configuration = {
                rules = {},
              },
            },
          },
        },
        basedpyright = {
          enabled = false,
          -- settings = {
          --   basedpyright = {
          --     analysis = {
          --       typeCheckingMode = "standard",
          --     },
          --   },
          -- },
        },
        vtsls = {
          enabled = true,
        },
        ts_ls = {
          enabled = false,
        },
        ruff = {
          init_options = {
            settings = {},
          },
        },
      },
    },
  },
}
