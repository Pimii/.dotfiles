local path_package = vim.fn.stdpath('data') .. '/site/'
-- local mini_path = path_package .. 'pack/deps/start/mini.nvim'
-- if not vim.loop.fs_stat(mini_path) then
--   vim.cmd('echo "Installing `mini.nvim`" | redraw')
--   local clone_cmd = {
--     'git', 'clone', '--filter=blob:none',
--     'https://github.com/echasnovski/mini.nvim', mini_path
--   }
--   vim.fn.system(clone_cmd)
--   vim.cmd('packadd mini.nvim | helptags ALL')
--   vim.cmd('echo "Installed `mini.nvim`" | redraw')
-- end

require('config.options')
require('config.keymaps')
require('config.editor')

require('mini.deps').setup({ path = { package = path_package } })

require('plugins.colorscheme')
require('plugins.icons')
require('plugins.pick')
require('plugins.notify')
require('plugins.treesitter')
require('plugins.diff')
require('plugins.files')
require('plugins.statusline')
require('plugins.bufremove')
require('plugins.visits')
require('plugins.indentscope')
require('plugins.completion')

require('code.lsp')
require('code.format')
