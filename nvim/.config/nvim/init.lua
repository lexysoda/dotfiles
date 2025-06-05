vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.o.clipboard = 'unnamedplus'
vim.o.completeopt = 'menuone,noselect'
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.cmd.colorscheme('gruvbox')

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = true
vim.o.foldlevel = 20

vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<C-h>', '<C-w><C-h>')
vim.keymap.set('n', '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-k>', '<C-w><C-k>')
vim.keymap.set('n', '<C-l>', '<C-w><C-l>')
vim.keymap.set('n', '//', ':noh<CR>', { silent = true })
vim.keymap.set('n', '<leader>u', '`[v`]U')

-- jk in terminal
vim.keymap.set('t', '<C-j><C-k>', '<C-\\><C-n>')

-- dont add commentlines on o/O
-- :h fo-table
vim.opt.formatoptions:remove "o"

-- cpp
vim.api.nvim_create_user_command(
  'FormatCpp',
  '!/opt/clang-format-static/clang-format-10 -style=file -i %', {}
)

-- vimnotes
vim.g.vimnotes_dir = '$HOME/notes'
