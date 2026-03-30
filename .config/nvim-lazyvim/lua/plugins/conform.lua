return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      xml = { "xmlformatter" },
      java = { "clang-format" },
      dart = { "dart_format" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
    },
  },
}
