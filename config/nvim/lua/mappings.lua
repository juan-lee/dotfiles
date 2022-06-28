-- builtin
vim.keymap.set("n", "<leader>n", "<Cmd>bn<CR>")
vim.keymap.set("n", "<leader>p", "<Cmd>bp<CR>")
vim.keymap.set("n", "<leader>a", "<Cmd>A<CR>")
vim.keymap.set("n", "<leader>w", "<C-w><C-w>")
vim.keymap.set("n", "<leader>q", "<Cmd>bp | bd #<CR>")

if vim.opt.diff:get() then
    vim.keymap.set("n", "<leader>q", "<Cmd>qa<CR>")
end

-- easymotion
vim.keymap.set("n", "<leader>j", "<Plug>(easymotion-j)")
vim.keymap.set("n", "<leader>k", "<Plug>(easymotion-k)")