local key_map = function(mode, key, result)
  vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

local map = vim.keymap.set

-- Disable arrow keys
key_map('', '<up>', '<nop>')
key_map('', '<down>', '<nop>')
key_map('', '<left>', '<nop>')
key_map('', '<right>', '<nop>')

-- Center when going up or down
key_map('n', '<C-u>', '<C-u>zz')
key_map('n', '<C-d>', '<C-d>zz')

-- Move to window with ctrl + hjkl keys
key_map('n', '<C-h>', '<C-w>h')
key_map('n', '<C-j>', '<C-w>j')
key_map('n', '<C-k>', '<C-w>k')
key_map('n', '<C-l>', '<C-w>l')

-- Move lines
key_map('n', '<A-j>', '<cmd>m .+1<cr>==')
key_map('n', '<A-k>', '<cmd>m .-2<cr>==')
key_map('i', '<A-j>', '<esc><cmd>m .-2<cr>==gi')
key_map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi')
key_map('v', '<A-j>', ':m \'>+1<cr>gv=gv')
key_map('v', '<A-k>', ':m \'<-2<cr>gv=gv')

-- Clear search with esc
key_map('n', '<esc>', '<cmd>noh<cr><esc>')
key_map('i', '<esc>', '<cmd>noh<cr><esc>')

-- Add undo break points
key_map('i', ',', ',<c-g>u')
key_map('i', '.', '.<c-g>u')
key_map('i', ';', ';<c-g>u')

-- Better indent
key_map('v', '<', '<gv')
key_map('v', '>', '>gv')

-- Location and quickfix list
key_map('n', '<leader>xl', '<cmd>lopen<cr>')
key_map('n', '<leader>xq', '<cmd>copen<cr>')

map('n', '[q', vim.cmd.cprev)
map('n', ']q', vim.cmd.cnext)

-- Toggle inlay hints
map('n', '<leader>th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)

-- Diagnostic
map('n', '<leader>cd', vim.diagnostic.open_float)
map('n', ']d', function()
  vim.diagnostic.jump({ count = 1, float = true })
end)
map('n', '[d', function()
  vim.diagnostic.jump({ count = -1, float = true })
end)
map('n', ']e', function()
  vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.ERROR })
end)
map('n', '[e', function()
  vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.ERROR })
end)
map('n', ']w', function()
  vim.diagnostic.jump({ count = 1, float = true, severity = vim.diagnostic.severity.WARN })
end)
map('n', '[w', function()
  vim.diagnostic.jump({ count = -1, float = true, severity = vim.diagnostic.severity.WARN })
end)
