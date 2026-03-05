return {
  -- gitステータスをsigncolumnに表示
  {
    "refractalize/oil-git-status.nvim",
    dependencies = { "stevearc/oil.nvim" },
    config = true,
  },
  -- LSP診断をvirtual textで表示
  {
    "JezerM/oil-lsp-diagnostics.nvim",
    dependencies = { "stevearc/oil.nvim" },
    opts = {},
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      default_file_explorer = true,
      columns = { "icon" },
      win_options = {
        signcolumn = "yes:2",
      },
      -- snacks explorerとのキー対応メモ（デフォルトに慣れるためコメントアウト）:
      -- ["l"] = "actions.select",            -- snacks: l = confirm/open  (oil default: <CR>)
      -- ["h"] = { "actions.parent", mode = "n" }, -- snacks: h = explorer_close (oil default: -)
      -- ["<BS>"] = { "actions.parent", mode = "n" }, -- snacks: <BS> = explorer_up (oil default: -)
      -- ["P"] = "actions.preview",           -- snacks: P = toggle_preview (oil default: <C-p>)
      -- ["u"] = "actions.refresh",           -- snacks: u = explorer_update (oil default: <C-l>)
      -- ["o"] = "actions.open_external",     -- snacks: o = explorer_open   (oil default: gx)
      -- ["H"] = "actions.toggle_hidden",     -- snacks: H = toggle_hidden   (oil default: g.)
      -- ["y"] = "actions.yank_entry",        -- snacks: y = explorer_yank   (oil default: none)
      view_options = {
        show_hidden = false,
      },
    },
    keys = {
      { "-", "<CMD>Oil<CR>", desc = "Open parent directory", mode = "n" },
      {
        "<leader>e",
        function()
          require("oil").open(LazyVim.root())
        end,
        desc = "Open file explorer oil (root dir)",
      },
      {
        "<leader>E",
        function()
          require("oil").open()
        end,
        desc = "Open file explorer oil (cwd)",
      },
    },
  },
}
