return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  config = function()
    require('oil').setup({
      keymaps = {
        ["gd"] = {
          desc = "Toggle file detail view",
          callback = function()
            Oil_detail = not Oil_detail
            if Oil_detail then
              require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
            else
              require("oil").set_columns({ "icon" })
            end
          end,
        },
      },
      view_options = {
        show_hidden = true,
      },
    })

    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
