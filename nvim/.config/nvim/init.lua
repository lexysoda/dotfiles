vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- open help/man in vsplit
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man" },
  command = "wincmd L",
})

-- persist folds / cursor position
local fold_group = vim.api.nvim_create_augroup("persistent_folds", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
  group = fold_group,
  pattern = "?*",  -- only real files, not unnamed buffers
  callback = function()
    if vim.bo.filetype ~= "" and not vim.bo.buftype:match("nofile") then
      vim.cmd("silent! mkview")
    end
  end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
  group = fold_group,
  pattern = "?*",
  callback = function()
    if vim.bo.filetype ~= "" and not vim.bo.buftype:match("nofile") then
      vim.cmd("silent! loadview")
    end
  end,
})

vim.opt.viewoptions = "folds,cursor"
