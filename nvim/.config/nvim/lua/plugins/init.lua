return {
  -- everforest theme
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      require("everforest").setup({
        background = "hard",
        on_highlights = function(hl, palette)
          hl.TerminalDim = { fg = palette.fg, bg = palette.bg_dim }
        end,
      })
      vim.cmd.colorscheme("everforest")

      -- Set terminal buffers to use Everforest Dark Dim background
      vim.api.nvim_create_autocmd("TermOpen", {
        desc = "Use Dim background for terminal buffers",
        callback = function()
          vim.opt_local.winhighlight = "Normal:TerminalDim"
        end,
      })
    end,
  },

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
