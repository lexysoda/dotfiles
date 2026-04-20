vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
      vim.schedule(function()
        local ok, err = pcall(vim.cmd, 'TSUpdateSync')
        if ok then
          vim.notify('nvim-treesitter updated successfully', vim.log.levels.INFO)
        else
          vim.notify('nvim-treesitter update failed: ' .. err, vim.log.levels.ERROR)
        end
      end)
    end
  end,
})

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

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
