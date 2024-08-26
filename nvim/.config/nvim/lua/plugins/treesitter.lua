return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc', 'regex', 'markdown_inline' },
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)

    -- also parse telekasten files, which are just markdown
    vim.treesitter.language.register('markdown', 'telekasten')
  end
}
