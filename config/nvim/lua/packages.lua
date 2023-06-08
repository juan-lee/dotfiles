-- bootstrap packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = true
  vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  vim.cmd [[packadd packer.nvim]]
end

require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- theme packages
  use "base16-project/base16-vim"
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      'RRethy/nvim-base16',
    }
  }

  -- lsp packages
  use {
    "neovim/nvim-lspconfig",
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
      'folke/neodev.nvim',
    }
  }

  -- cmp packages
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    }
  }

  -- telescope packages
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      "ryanoasis/vim-devicons",
      "nvim-lua/plenary.nvim",

    }
  }
  use "nvim-telescope/telescope-file-browser.nvim"

  -- treesitter packages
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use { "nvim-treesitter/nvim-treesitter-context", after = "nvim-treesitter" }
  use { "nvim-treesitter/nvim-treesitter-refactor", after = "nvim-treesitter" }
  use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" }

  -- tpope packages
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

  -- dap packages
  use "mfussenegger/nvim-dap"
  use "leoluz/nvim-dap-go"
  use "nvim-telescope/telescope-dap.nvim"
  use "rcarriga/nvim-dap-ui"
  use "theHamsta/nvim-dap-virtual-text"

  -- terminal packages
  use "akinsho/toggleterm.nvim"

  use "ray-x/go.nvim"
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use "github/copilot.vim"

  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- :PackerCompile whenever this file is updated
vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost packages.lua source <afile> | PackerCompile
  augroup end
]])
