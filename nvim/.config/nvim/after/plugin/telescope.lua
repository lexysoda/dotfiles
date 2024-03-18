require('telescope').setup()
require('telescope').load_extension('fzf')

local tel = require('telescope.builtin')
vim.keymap.set('n', '<Leader>gf', tel.find_files)
vim.keymap.set('n', '<Leader>ggf', tel.git_files)
vim.keymap.set('n', '<Leader>gg', tel.live_grep)
vim.keymap.set('n', '<Leader>ggg', tel.grep_string)
vim.keymap.set('n', '<Leader>gh', tel.help_tags)
