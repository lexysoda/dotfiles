require('nvim-treesitter').setup {
  auto_install = true,
  highlight = {
    enable = true,
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.cmd([[ set nofoldenable]])
