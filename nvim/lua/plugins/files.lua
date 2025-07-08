MiniDeps.add('echasnovski/mini.files')

require('mini.files').setup()

vim.keymap.set('n', '<leader>e', function()
  require('mini.files').open()
end, { noremap = true, silent = true })
