return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- https://www.lazyvim.org/configuration/recipes#add-eslint-and-use-it-for-formatting
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "tsserver" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { { "mlaursen/vim-react-snippets" } },
    opts = function(_, opts)
      require("vim-react-snippets").lazy_load()
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        mode = "tabs",
        always_show_bufferline = true,
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          { "s", group = "screen" },
        },
      },
    },
  },
  {
    "folke/flash.nvim",
    -- stylua: ignore
    keys = {
      { "s", false },
      { "S", false },
      { "<leader>sf", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "<leader>sF", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
  {
    "mrcjkb/rustaceanvim",
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
}
