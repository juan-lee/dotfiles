-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
end

vim.cmd [[packadd packer.nvim]]

-- :PackerCompile whenever this file is updated
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- lua plugins
  use 'lewis6991/impatient.nvim'
  use "nvim-lua/plenary.nvim"

  -- theme plugins
  use "base16-project/base16-vim"
  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  -- navigation plugins
  use "easymotion/vim-easymotion"

  -- cmp plugins
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/cmp-nvim-lua"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/vim-vsnip"
  use "neovim/nvim-lspconfig"

  -- telescope plugins
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-file-browser.nvim"
  use "ryanoasis/vim-devicons"

  -- treesitter plugins
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use "nvim-treesitter/nvim-treesitter-context"
  use "nvim-treesitter/nvim-treesitter-refactor"
  use "nvim-treesitter/nvim-treesitter-textobjects"

  -- tpope plugins
  use "tpope/vim-abolish"
  use "tpope/vim-commentary"
  use "tpope/vim-dadbod"
  use "tpope/vim-dispatch"
  use "tpope/vim-eunuch"
  use "tpope/vim-fugitive"
  use "tpope/vim-jdaddy"
  use "tpope/vim-markdown"
  use "tpope/vim-repeat"
  use "tpope/vim-rhubarb"
  use "tpope/vim-sensible"
  use "tpope/vim-sleuth"
  use "tpope/vim-surround"
  use "tpope/vim-unimpaired"
  use "tpope/vim-vinegar"

  -- dap plugins
  use "mfussenegger/nvim-dap"
  use "leoluz/nvim-dap-go"
  use "nvim-telescope/telescope-dap.nvim"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"

  -- terminal plugins
  use "akinsho/toggleterm.nvim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)
