-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- Disable spell checking for markdown files
vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- JS/TS の LSP formatting は conform.nvim に統一するため無効化
-- diagnostics は引き続き各 LSP が担う
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    if vim.tbl_contains({ "eslint", "biome", "vtsls", "ts_ls" }, client.name) then
      client.server_capabilities.documentFormattingProvider = false
    end
  end,
})
