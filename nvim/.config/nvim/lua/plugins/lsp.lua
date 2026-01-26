return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'folke/lazydev.nvim', ft = 'lua' },
  },
  config = function()
    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = '*.go',
      callback = function()
        vim.lsp.buf.format()
      end
    })

    local cap = require('cmp_nvim_lsp').default_capabilities()
    vim.lsp.config("*", {
      capabilities = cap,
    })

    vim.lsp.enable('gopls')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('rust_analyzer')
    vim.lsp.enable('basedpyright')
  end,
}
