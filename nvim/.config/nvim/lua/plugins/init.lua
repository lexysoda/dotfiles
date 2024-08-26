return {
  -- gruvbox everywhere
  'morhetz/gruvbox',

  -- tpope god
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',
  'tpope/vim-unimpaired',
  'tpope/vim-surround',

  -- gc to comment
  { 'numToStr/Comment.nvim',               opts = {} },

  -- indentation indicators
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",                                      opts = {} },

  -- quick terminal
  { 'lexysoda/nvim-toggle-term',           dir = '~/development/nvim-toggle-term/' },

  -- notes
  { 'renerocksai/telekasten.nvim',         dependencies = { 'nvim-telescope/telescope.nvim' } },

  -- statusline
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
}
