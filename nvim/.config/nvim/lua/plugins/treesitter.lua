return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  main = 'nvim-treesitter',
  init = function()
    vim.treesitter.language.register('markdown', 'telekasten')
    vim.treesitter.language.register('bash', 'shell')

    vim.api.nvim_create_autocmd('FileType', { 
      callback = function() 
        -- Highlighting
        pcall(vim.treesitter.start) 
        -- Indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" 
        -- Folding
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo[0][0].foldmethod = 'expr'
      end, 
    }) 
  end,
}
