require('plugins')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 3
vim.o.smartcase = true
vim.o.tabstop = 3
vim.o.termguicolors = true
vim.cmd.colorscheme('gruvbox')

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = false

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')

-- netrw
vim.g.netrw_keepj = ''
vim.g.netrw_banner = 0
vim.g.netrw_netrw_fastbrowse = 2

-- cpp
vim.api.nvim_create_user_command(
  'FormatCpp',
  '!/opt/clang-format-static/clang-format-10 -style=file -i %', {}
)
