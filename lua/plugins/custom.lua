return {
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        eslint = {},
        yamlls = { settings = { yaml = { format = { singleQuote = true } } } },
      },
    },
  },
  {
    "blink.cmp",
    dependencies = { { "mlaursen/vim-react-snippets", opts = {} } },
    opts = function(_, opts)
      require("luasnip.loaders.from_lua").load()
      opts.snippets.preset = "luasnip"
    end,
  },
  {
    "bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        always_show_bufferline = true,
      },
    },
  },
  {
    "which-key.nvim",
    opts = {
      spec = {
        {
          { "s", group = "screen" },
        },
      },
    },
  },
  {
    "flash.nvim",
    -- stylua: ignore
    keys = {
      { "s", false },
      { "S", false },
      { "<leader>sf", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "<leader>sF", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    "rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            procMacro = {
              ignored = {
                ["async-trait"] = vim.NIL,
              },
            },
          },
        },
      },
    },
  },
  {
    "copilot.lua",
    config = function(_, opts)
      require("copilot").setup({
        -- copilot_node_command = "/Users/toriumi0118/.local/share/mise/installs/node/22.14.0/bin/node",
        copilot_node_command = vim.fn.expand("$HOME") .. "/.local/share/mise/installs/node/22.14.0/bin/node",
      })
    end,
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      dashboard = { enabled = false },
    },
    keys = {
      -- <leader>e/<leader>E はoilに譲るため無効化
      { "<leader>e", false },
      { "<leader>E", false },
      -- 隠しファイルを含むファイル探索
      {
        "<leader>fh",
        function()
          Snacks.picker.files({ hidden = true })
        end,
        desc = "Find Files (hidden)",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      messages = {
        enabled = false,
      },
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.nvim" }, -- if you use the mini.nvim suite
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      code = {
        border = "thick",
      },
    },
  },
  { "mattn/vim-typespec" },
}
