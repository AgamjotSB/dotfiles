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
    vim.env.CHROME_EXECUTABLE = "zen-browser"

    local flutter_utils = require("flutter-tools.utils")
    flutter_utils.open_command = function()
      local chromium = vim.fn.exepath("chromium")
      local zen = vim.fn.exepath("zen-browser")
      return "bash",
        {
          "-c",
          string.format(
            [=[
            url=$1
            if [[ "$url" == *"127.0.0.1"* ]]; then
              "%s" --app="$url"
            else
              "%s" "$url"
            fi
          ]=],
            chromium,
            zen
          ),
          "--",
        }
    end

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

    local visual_debug_open = false
    local inspect_widget_open = false

    local wk = require("which-key")
    wk.add({
      { "<leader>F", group = "Flutter", icon = "" },
      { "<leader>Fc", "<cmd>FlutterLogClear<cr>", icon = " ", desc = "Clear Log" },
      { "<leader>Fd", "<cmd>FlutterDevTools<cr>", icon = " ", desc = "Dev Tools" },
      { "<leader>FD", "<cmd>FlutterDevices<cr>", icon = "󰾰 ", desc = "Devices" },
      { "<leader>Fe", "<cmd>FlutterEmulators<cr>", icon = " ", desc = "Emulators" },
      { "<leader>Fg", "<cmd>FlutterPubGet<cr>", icon = " ", desc = "Pub Get" },
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
      {
        "<leader>Fi",
        function()
          inspect_widget_open = not inspect_widget_open
          vim.cmd("FlutterInspectWidget")
        end,
        icon = function()
          return inspect_widget_open and { icon = " ", color = "green" } or { icon = " ", color = "yellow" }
        end,
        desc = function()
          return inspect_widget_open and "Disable Inspector" or "Enable Inspector"
        end,
      },
      {
        "<leader>Fv",
        function()
          visual_debug_open = not visual_debug_open
          vim.cmd("FlutterVisualDebug")
        end,
        icon = function()
          return visual_debug_open and { icon = " ", color = "green" } or { icon = " ", color = "yellow" }
        end,
        desc = function()
          return visual_debug_open and "Disable Visual Debug" or "Enable Visual Debug"
        end,
      },
    })
  end,
}
