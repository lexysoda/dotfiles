vim.g.vimnotes_dir = '$HOME/notes'
vim.keymap.set('n', '<Leader>vn', ':NotesFZF', { silent = true })
vim.keymap.set('n', '<Leader>vd', ':NotesOpenDiary<CR>', { silent = true })
vim.keymap.set('n', '<Leader>vt', ':NotesOpenTopic ')
