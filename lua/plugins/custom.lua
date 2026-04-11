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
        cmd = { vim.fn.expand("$HOME") .. "/.local/share/mise/shims/rust-analyzer" },
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
          Snacks.picker.files({ hidden = true, no_ignore = true })
        end,
        desc = "Find Files (hidden)",
      },
      -- ファイル名 + コンテンツのfuzzy find
      -- item.text = "filename content" として snacks matcher が空白区切りで AND 検索
      {
        "<leader>fs",
        function()
          Snacks.picker({
            title = "Find Files & Content",
            finder = function(opts, ctx)
              return require("snacks.picker.source.proc").proc(
                ctx:opts({
                  cmd = "rg",
                  args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--smart-case",
                    "--hidden",
                    "--glob=!.git",
                    "--glob=!.bare",
                    "-0",
                    "--",
                    "", -- 空パターン = 全行マッチ
                  },
                  transform = function(item)
                    local null_pos = item.text:find("\0")
                    if not null_pos then
                      return false
                    end
                    local file = item.text:sub(1, null_pos - 1)
                    local rest = item.text:sub(null_pos + 1)
                    local lnum, text = rest:match("^(%d+):(.*)")
                    if not lnum then
                      return false
                    end
                    item.file = file
                    item.pos = { tonumber(lnum), 0 }
                    -- ファイル名とコンテンツを結合: "api.dart abc" のように検索できる
                    item.text = file .. " " .. vim.trim(text)
                  end,
                }),
                ctx
              )
            end,
          })
        end,
        desc = "Find Files & Content",
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
