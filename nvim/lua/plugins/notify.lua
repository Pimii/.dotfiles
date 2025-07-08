MiniDeps.add('echasnovski/mini.notify')

local win_config = function()
  local has_statusline = vim.o.laststatus > 0
  local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
  return { anchor = 'SE', col = vim.o.columns, row = vim.o.lines - pad }
end

require('mini.notify').setup({
  window = {
    config = win_config,
  },
})

vim.notify = require('mini.notify').make_notify()

vim.keymap.set('n', '<leader>snh', function()
  require('mini.notify').show_history()
end, { noremap = true, silent = true })
