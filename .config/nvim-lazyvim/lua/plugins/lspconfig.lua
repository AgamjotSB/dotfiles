return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false, -- for tiny-inline-diagnostic lua
      },
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- ty = {
        --   init_options = {},
        --   settings = {
        --     ty = {
        --       configuration = {
        --         rules = {},
        --       },
        --     },
        --   },
        -- },
        basedpyright = {
          enabled = true,
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
              },
            },
          },
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
