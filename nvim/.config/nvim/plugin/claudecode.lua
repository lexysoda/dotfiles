vim.pack.add({ 'https://github.com/coder/claudecode.nvim' }, { load = false })

local loaded = false

local function ensure_loaded()
  if loaded then
    return
  end
  vim.cmd.packadd('claudecode.nvim')
  require('claudecode').setup({
    terminal = {
      provider = 'native',
      split_side = 'right',
      split_width_percentage = 0.35,
    },
  })
  loaded = true
end

local function claude(cmd)
  return function()
    ensure_loaded()
    vim.cmd(cmd)
  end
end

vim.keymap.set('n', '<leader>cc', claude('ClaudeCode'), { desc = 'Toggle [C]laude' })
vim.keymap.set('n', '<leader>cf', claude('ClaudeCodeFocus'), { desc = '[F]ocus Claude' })
vim.keymap.set('n', '<leader>cr', claude('ClaudeCode --resume'), { desc = '[R]esume Claude' })
vim.keymap.set('n', '<leader>cC', claude('ClaudeCode --continue'), { desc = '[C]ontinue Claude' })
vim.keymap.set('n', '<leader>cm', claude('ClaudeCodeSelectModel'), { desc = 'Select Claude [m]odel' })
vim.keymap.set('n', '<leader>cb', claude('ClaudeCodeAdd %'), { desc = 'Add current [b]uffer' })
vim.keymap.set('v', '<leader>cs', claude('ClaudeCodeSend'), { desc = '[S]end selection to Claude' })
vim.keymap.set('n', '<leader>ca', claude('ClaudeCodeDiffAccept'), { desc = '[A]ccept diff' })
vim.keymap.set('n', '<leader>cd', claude('ClaudeCodeDiffDeny'), { desc = '[D]eny diff' })

local oil_group = vim.api.nvim_create_augroup('claudecode_oil', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'oil' },
  callback = function(ev)
    vim.keymap.set('n', '<leader>cs', claude('ClaudeCodeTreeAdd'), { buffer = ev.buf, desc = '[S]end file to Claude' })
  end,
  group = oil_group,
})
