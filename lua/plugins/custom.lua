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
    -- version = '1.*',
    -- -- `main` is untested, please open a PR if you've confirmed it works as expected
    dependencies = { { "L3MON4D3/LuaSnip", version = "v2.*" }, { "mlaursen/vim-react-snippets" } },
    opts = function(_, opts)
      opts.snippets = { preset = "luasnip" }
      opts.sources.default = { "lsp", "path", "snippets", "buffer" }
      require("vim-react-snippets").lazy_load()
    end,
  },
}
