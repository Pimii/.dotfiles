MiniDeps.add('echasnovski/mini.pick')

local MiniPick = require('mini.pick')

MiniPick.setup()

vim.ui.select = MiniPick.ui_select

vim.keymap.set('n', '<leader><leader>', function()
  MiniPick.builtin.files()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>fg', function()
  MiniPick.builtin.grep()
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>fw', function()
  MiniPick.builtin.grep({ pattern = vim.fn.expand('<cword>') })
end, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>/', function()
  MiniPick.builtin.grep_live()
end, { noremap = true, silent = true })

local wipeout_cur = function()
  vim.api.nvim_buf_delete(MiniPick.get_picker_matches().current.bufnr, {})
end
vim.keymap.set('n', '<leader>fb', function()
  MiniPick.builtin.buffers({}, {
    mappings = {
      wipeout = {
        char = '<C-d>',
        func = wipeout_cur,
      },
    },
  })
end, { noremap = true, silent = true })
