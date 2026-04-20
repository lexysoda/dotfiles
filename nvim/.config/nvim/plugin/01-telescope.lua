vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      local res = vim.system({ 'make' }, { cwd = ev.data.path })
      if vim.v.shell_error ~= 0 then
        vim.notify('Failed to compile fzf-native: ' .. res, vim.log.levels.ERROR)
      else
        vim.notify('Successfully compiled fzf-native', vim.log.levels.INFO)
      end
    end
  end,
})

vim.pack.add({
  'https://github.com/echasnovski/mini.icons',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
})

require('telescope').setup {
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
  pickers = {
    grep_string = {
      additional_args = { "--hidden" },
      file_ignore_patterns = { '.git', '.gitignore' },
    },
    live_grep = {
      additional_args = { "--hidden" },
      file_ignore_patterns = { '.git', '.gitignore' },
      mappings = {
        i = { ['<c-f>'] = require('telescope.actions').to_fuzzy_refine },
      },
    },
  },
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', function()
  vim.fn.system('git rev-parse --is-inside-work-tree')
  if vim.v.shell_error == 0 then
    builtin.git_files()
  else
    builtin.find_files()
  end
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader><leader>',
  function() builtin.grep_string { search = '', word_match = '-w', path_display = { 'smart' } } end,
  { desc = 'Fuzzy search over all text in dir (similar to ag+fzf)' })
