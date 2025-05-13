return {
  {
    "nvim-flutter/flutter-tools.nvim",
    dependencies = {
      "dart-lang/dart-vim-plugin",
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        flutter_path = nil,
        flutter_lookup_cmd = "mise where flutter",
        widget_guides = {
          enabled = true,
        },
        settings = {
          enableSnippets = false,
        },
      })

      vim.g.dart_style_guide = 2
      -- vim.g.dart_format_on_save = 1
      vim.g.dart_trailing_comma_indent = true
    end,
  },
}
