vim.pack.add({ 'https://github.com/folke/lazydev.nvim' })
require("lazydev").setup()

vim.pack.add({ 'https://github.com/mason-org/mason.nvim' })
require("mason").setup()

vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })

vim.pack.add({ 'https://github.com/mason-org/mason-lspconfig.nvim' })
require("mason-lspconfig").setup {
  ensure_installed = {
    "gopls",
    "lua_ls",
    "rust_analyzer",
    "basedpyright",
  },
}

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function(args)
    vim.lsp.buf.format({ bufnr = args.buf })
  end,
})
