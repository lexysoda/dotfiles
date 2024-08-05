require('telekasten').setup({
  home = vim.fn.expand("~/notes"),
  dailies = vim.fn.expand("~/notes/diary"),
  templates = vim.fn.expand("~/notes/templates"),

  template_new_note = vim.fn.expand("~/notes/templates/note.md"),
  template_new_daily = vim.fn.expand("~/notes/templates/diary.md"),
  template_handling = 'prefer_new_note',

  image_subdir = "img",

  journal_auto_open = true,

  tag_notation = "yaml-bare",
})

vim.keymap.set('n', '<leader>zf', require('telekasten').find_notes)
vim.keymap.set('n', '<leader>zd', require('telekasten').goto_today)
vim.keymap.set('n', '<leader>zg', require('telekasten').search_notes)
vim.keymap.set('n', '<leader>zn', require('telekasten').new_note)
vim.keymap.set('n', '<leader>zt', require('telekasten').show_tags)

local group = vim.api.nvim_create_augroup("telekasten_autoconmmands", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "telekasten" },
  callback = function(ev)
    vim.keymap.set('n', '<Leader>t', require('telekasten').toggle_todo, { buffer = true })
  end,
  group = group,
})
