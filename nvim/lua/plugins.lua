return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- tpope god
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use "tpope/vim-sleuth"
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'

  use 'morhetz/gruvbox'

  use 'lukas-reineke/indent-blankline.nvim'

  use 'neovim/nvim-lspconfig'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  use 'lexysoda/vim-notes'

  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} },
  }

  use 'nvim-telescope/telescope-fzy-native.nvim'
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  }

end)
