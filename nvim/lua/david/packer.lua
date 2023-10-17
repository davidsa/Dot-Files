-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'ThePrimeagen/harpoon'
  use 'preservim/nerdtree'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'wbthomason/packer.nvim'
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use 'RRethy/nvim-treesitter-endwise'
  use 'terryma/vim-multiple-cursors'
  use 'mattn/emmet-vim'
  use 'zivyangll/git-blame.vim'
  use 'ap/vim-css-color'
  use 'ryanoasis/vim-devicons'
  use "lukas-reineke/indent-blankline.nvim"
  use 'christoomey/vim-tmux-navigator'
  use 'easymotion/vim-easymotion'
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'
  use 'scrooloose/nerdcommenter'
  use 'SirVer/ultisnips'
  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use 'slim-template/vim-slim'
  use 'airblade/vim-gitgutter'
  use 'kshenoy/vim-signature'
  use 'kevinhwang91/nvim-bqf'


  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    "rebelot/kanagawa.nvim",
    as = 'kanagawa',
    config = function()
      vim.cmd('colorscheme kanagawa-wave')
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-nvim-lua' },
      { 'rafamadriz/friendly-snippets' },
      { 'honza/vim-snippets' },
      {
        'quangnguyen30192/cmp-nvim-ultisnips',
        config = function()
          require("cmp_nvim_ultisnips").setup({})
        end
      }
    }
  }

  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')
  use('mbbill/undotree')
end)
