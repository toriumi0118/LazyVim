-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- delete default tabs mappings
vim.keymap.del("n", "<leader><tab>l")
vim.keymap.del("n", "<leader><tab>o")
vim.keymap.del("n", "<leader><tab>f")
vim.keymap.del("n", "<leader><tab><tab>")
vim.keymap.del("n", "<leader><tab>]")
vim.keymap.del("n", "<leader><tab>d")
vim.keymap.del("n", "<leader><tab>[")

-- スクリーン分割
vim.keymap.set("n", "sj", "<C-w>j", { desc = "Move to split below" })
vim.keymap.set("n", "sk", "<C-w>k", { desc = "Move to split above" })
vim.keymap.set("n", "sl", "<C-w>l", { desc = "Move to split right" })
vim.keymap.set("n", "sh", "<C-w>h", { desc = "Move to split left" })
vim.keymap.set("n", "sJ", "<C-w>J", { desc = "Move current split to bottom" })
vim.keymap.set("n", "sK", "<C-w>K", { desc = "Move current split to top" })
vim.keymap.set("n", "sL", "<C-w>L", { desc = "Move current split to far right" })
vim.keymap.set("n", "sH", "<C-w>H", { desc = "Move current split to far left" })
vim.keymap.set("n", "s=", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "so", "<C-w>_<C-w>|", { desc = "Maximize current split" })
vim.keymap.set("n", "ss", ":sp<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "sv", ":vs<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "s>", "<C-w>>", { desc = "Increase vertical split width" })
vim.keymap.set("n", "s<", "<C-w><", { desc = "Decrease vertical split width" })
vim.keymap.set("n", "s+", "<C-w>+", { desc = "Increase split height" })
vim.keymap.set("n", "s-", "<C-w>-", { desc = "Decrease split height" })

-- タブ操作
vim.keymap.set("n", "st", ":tabnew<CR>", { silent = true, desc = "Open new tab" })
vim.keymap.set("n", "sn", ":tabnext<CR>", { silent = true, desc = "Next tab" })
vim.keymap.set("n", "sp", ":tabprevious<CR>", { silent = true, desc = "Previous tab" })
vim.keymap.set("n", "sx", ":tabclose<CR>", { silent = true, desc = "Close current tab" })
vim.keymap.set("n", "sN", ":tab split<CR>", { silent = true, desc = "Split buffer into new tab" })

-- 特定の番号のタブに移動（s1〜s9）
for i = 1, 9 do
  vim.keymap.set("n", "s" .. i, ":tabnext " .. i .. "<CR>", { silent = true, desc = "Go to tab " .. i })
  vim.keymap.set(
    "n",
    "sm" .. i,
    ":tabmove " .. (i - 1) .. "<CR>",
    { silent = true, desc = "Move tab to position " .. i }
  )
end

vim.keymap.set("n", "<leader>fa", function()
  vim.fn.setreg("+", vim.fn.expand("%:."))
end, { desc = "Copy relative file path to clipboard" })
