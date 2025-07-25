MiniDeps.add('echasnovski/mini.bufremove')

require('mini.bufremove').setup()

vim.keymap.set('n', '<leader>bd', function()
  local bd = require('mini.bufremove').delete
  if vim.bo.modified then
    local choice = vim.fn.confirm(('Save changes to %q?'):format(vim.fn.bufname()), '&Yes\n&No\n&Cancel')
    if choice == 1 then
      vim.cmd.write()
      bd(0)
    elseif choice == 2 then
      bd(0, true)
    end
  else
    bd(0)
  end
end, { noremap = true, silent = true })
