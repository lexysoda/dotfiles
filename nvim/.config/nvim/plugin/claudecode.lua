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

vim.keymap.set('n', '<leader>cc', claude('ClaudeCodeFocus'), { desc = 'Open/focus [C]laude' })
vim.keymap.set('n', '<leader>cs', claude('ClaudeCodeAdd %'), { desc = '[S]end current buffer' })
vim.keymap.set('v', '<leader>cs', claude('ClaudeCodeSend'), { desc = '[S]end selection to Claude' })

local oil_group = vim.api.nvim_create_augroup('claudecode_oil', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'oil' },
  callback = function(ev)
    vim.keymap.set('n', '<leader>cs', claude('ClaudeCodeTreeAdd'), { buffer = ev.buf, desc = '[S]end file to Claude' })
  end,
  group = oil_group,
})
