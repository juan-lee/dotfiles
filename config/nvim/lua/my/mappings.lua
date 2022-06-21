-- builtin
vim.keymap.set('n', '<leader>n', ':bn<CR>')
vim.keymap.set('n', '<leader>p', ':bp<CR>')
vim.keymap.set('n', '<leader>a', ':A<CR>')
vim.keymap.set('n', '<leader>w', ':bp | bd #<CR>')
vim.keymap.set('n', '<leader>q', ':q!<CR>')

-- telescope
vim.keymap.set('n', '<leader>t', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>g', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>G', ':Telescope grep_string<CR>')
vim.keymap.set('n', '<leader>u', ':Telescope buffers<CR>')

-- easymotion
vim.keymap.set('n', '<leader>j', '<Plug>(easymotion-j)')
vim.keymap.set('n', '<leader>k', '<Plug>(easymotion-k)')

