return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        basedpyright = {
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
      },
    },
  },
}
