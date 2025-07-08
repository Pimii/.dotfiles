MiniDeps.add('echasnovski/mini.visits')

local MiniVisits = require('mini.visits')
MiniVisits.setup()

vim.g.minivisits_disable = true

local map_vis = function(keys, call, desc)
  local rhs = '<Cmd>lua MiniVisits.' .. call .. '<CR>'
  vim.keymap.set('n', '<Leader>' .. keys, rhs, { desc = desc })
end
map_vis('va', 'add_label("core")', 'Add label')
map_vis('vr', 'remove_label("core")', 'Remove label')
map_vis('vc', 'select_path(nil, { filter = "core" })', 'Select label')

local select_vis = function(number)
  local path_list = MiniVisits.list_paths(nil, { filter = 'core' })
  if path_list[number] then
    vim.cmd('edit ' .. path_list[number])
  end
end

vim.keymap.set('n', '<F1>', function()
  select_vis(1)
end, { desc = 'Select label 1' })
vim.keymap.set('n', '<F2>', function()
  select_vis(2)
end, { desc = 'Select label 2' })
vim.keymap.set('n', '<F3>', function()
  select_vis(3)
end, { desc = 'Select label 3' })
vim.keymap.set('n', '<F4>', function()
  select_vis(4)
end, { desc = 'Select label 4' })
vim.keymap.set('n', '<F5>', function()
  select_vis(5)
end, { desc = 'Select label 5' })
vim.keymap.set('n', '<F6>', function()
  select_vis(6)
end, { desc = 'Select label 6' })
vim.keymap.set('n', '<F7>', function()
  select_vis(7)
end, { desc = 'Select label 7' })
vim.keymap.set('n', '<F8>', function()
  select_vis(8)
end, { desc = 'Select label 8' })
vim.keymap.set('n', '<F9>', function()
  select_vis(9)
end, { desc = 'Select label 9' })
