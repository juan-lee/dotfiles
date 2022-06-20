vim.g.mapleader = ' '
vim.g['netrw_fastbrowse'] = 0

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.expandtab = true
vim.opt.foldenable = false
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.shortmess:append({ c =  true})
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.undofile = true

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank {higroup="IncSearch", timeout=500}
    end,
})
