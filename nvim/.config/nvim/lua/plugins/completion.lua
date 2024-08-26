return {
  'hrsh7th/nvim-cmp',
  priority = 100,
  dependencies = {
    'onsails/lspkind.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
  },
  config = function()
    local lspkind = require('lspkind')
    local cmp = require('cmp')

    cmp.setup {
      sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
      },
      mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-y>'] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true },
      },
      formatting = {
        format = lspkind.cmp_format(),
      },
    }
  end,
}
