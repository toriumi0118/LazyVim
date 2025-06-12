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
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            elseif client.name == "ts-ls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "blink.cmp",
    dependencies = { { "mlaursen/vim-react-snippets" } },
    opts = function(_, opts)
      require("luasnip.loaders.from_lua").load()
      require("vim-react-snippets").lazy_load()
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
  },
}
