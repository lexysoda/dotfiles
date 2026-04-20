vim.pack.add({ 'https://github.com/folke/lazydev.nvim' })
require("lazydev").setup()

vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf })
  end,
})

vim.lsp.enable('gopls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('basedpyright')
