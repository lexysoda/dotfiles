-- colorscheme
vim.pack.add({ "https://github.com/neanias/everforest-nvim" })

vim.o.background = "dark"

require("everforest").setup({
  background = "hard",
  on_highlights = function(hl, palette)
    hl.TerminalDim = { fg = palette.fg, bg = palette.bg_dim }
  end,
})

vim.cmd.colorscheme("everforest")

-- -- Set terminal buffers to use Everforest Dark Dim background
vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Use Dim background for terminal buffers",
  callback = function()
    vim.opt_local.winhighlight = "Normal:TerminalDim"
  end,
})

vim.pack.add({ 'https://github.com/echasnovski/mini.icons' })

-- mock devicons
-- :h MiniIcons.mock_nvim_web_devicons()
require('mini.icons').setup()
MiniIcons.mock_nvim_web_devicons()


-- lualine
vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
require('lualine').setup()

-- indent-blankline
vim.pack.add({ "https://github.com/lukas-reineke/indent-blankline.nvim" })
require("ibl").setup()
