return {
  "nvim-flutter/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/which-key.nvim",
  },

  opts = {
    fvm = true,
    lsp = {
      color = {
        enabled = true,
        background = true,
      },
      settings = {
        showTodos = false,
      },
    },
    dev_tools = {
      auto_open_browser = true,
    },
  },

  config = function(_, opts)
    -- Get the extended capabilities from LazyVim's completion engine (blink.cmp)
    -- This enables snippets, auto-imports, and other advanced LSP features.
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Inject them into the flutter-tools options
    opts.lsp = opts.lsp or {}
    opts.lsp.capabilities = capabilities

    vim.env.CHROME_EXECUTABLE = "zen-browser"
    require("flutter-tools").setup(opts)

    local function is_flutter_win_open(win_name)
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        if name:match(win_name) then
          return true
        end
      end
      return false
    end

    local wk = require("which-key")
    wk.add({
      { "<leader>F", group = "Flutter", icon = "" },
      { "<leader>Fc", "<cmd>FlutterLogClear<cr>", icon = "", desc = "Clear Log" },
      { "<leader>Fd", "<cmd>FlutterDevTools<cr>", icon = "", desc = "Dev Tools" },
      { "<leader>FD", "<cmd>FlutterDevices<cr>", icon = "󰾰", desc = "Devices" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", icon = "", desc = "Emulators" },
      {
        "<leader>Fl",
        function()
          vim.cmd("FlutterLogToggle")
        end,
        icon = function()
          return is_flutter_win_open("FLUTTER_DEV_LOG") and { icon = " ", color = "green" }
            or { icon = " ", color = "yellow" }
        end,
        desc = function()
          return is_flutter_win_open("FLUTTER_DEV_LOG") and "Disable Log" or "Enable Log"
        end,
      },
      {
        "<leader>Fo",
        function()
          vim.cmd("FlutterOutlineToggle")
        end,
        icon = function()
          return is_flutter_win_open("Flutter Outline") and { icon = " ", color = "green" }
            or { icon = " ", color = "yellow" }
        end,
        desc = function()
          return is_flutter_win_open("Flutter Outline") and "Disable Outline" or "Enable Outline"
        end,
      },
    })
  end,
}
