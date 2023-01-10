vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g["netrw_fastbrowse"] = 0

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.o.breakindent = true
vim.o.completeopt = "menuone,noselect"
vim.o.expandtab = true
vim.o.foldenable = false
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = "nosplit"
vim.o.maxmempattern = 5000
vim.o.number = true
vim.opt.shortmess:append({ c = true })
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.showmatch = true
vim.o.showmode = false
vim.o.smartcase = true
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ timeout = 500 })
  end,
  group = highlight_group,
  pattern = '*',
})

if vim.opt.diff:get() then
    vim.opt.diffopt:append({ context = 1000, vertical = true })
end

-- Exclude QuickFix from buflisted
local qf_group = vim.api.nvim_create_augroup("qf", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    group = qf_group,
    callback = function()
        vim.o.buflisted = false
    end,
})

vim.diagnostic.config({
    signs = false,
})
