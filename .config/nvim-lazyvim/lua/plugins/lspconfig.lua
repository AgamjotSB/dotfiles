return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false, -- for tiny-inline-diagnostic lua
        update_in_insert = true,
      },
      inlay_hints = {
        enabled = false,
      },
      servers = {
        ty = {
          enabled = false,
          init_options = {},
          settings = {
            ty = {
              diagnosticMode = "on",
              configuration = {
                rules = {},
              },
            },
          },
        },

        basedpyright = {
          enabled = true,
          settings = {
            basedpyright = {
              -- using ruff import organizer
              disableOrganizeImports = true,
              -- disableLanguageServices = true,
              analysis = {
                typeCheckingMode = "standard",
              },
            },
          },
        },

        zuban = {
          enabled = false,
        },
        pyrefly = {
          enabled = false,
        },

        ruff = {
          init_options = {
            settings = {
              diagnostics = true,
              fixAll = true,
            },
          },
        },
      },
    },
  },
}
