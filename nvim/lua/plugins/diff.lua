MiniDeps.add('echasnovski/mini.diff')

require('mini.diff').setup({
  mappings = {
    apply = '',
    reset = 'ghr',
    textobject = '',
  },
})

vim.keymap.set('n', 'ghb', function()
  local filename = vim.fn.expand('%')
  local line = vim.api.nvim_win_get_cursor(0)[1]
  MiniPick.builtin.cli({ command = { 'git', 'blame', '-p', '-L', line .. ',' .. line, '--', filename } })
end, { noremap = true, silent = true, desc = 'Git blame' })
