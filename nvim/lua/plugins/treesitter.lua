MiniDeps.add({
  source = 'nvim-treesitter/nvim-treesitter',
  checkout = 'master',
  monitor = 'main',
  hooks = {
    post_checkout = function()
      vim.cmd('TSUpdate')
    end,
  },
})

require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'cmake',
    'css',
    'csv',
    'diff',
    'git_config',
    'gitcommit',
    'gitignore',
    'go',
    'html',
    'json',
    'lua',
    'make',
    'markdown',
    'markdown_inline',
    'proto',
    'python',
    'regex',
    'rust',
    'sql',
    'ssh_config',
    'tmux',
    'vimdoc',
    'xml',
    'yaml',
    'zig',
  },
  highlight = { enable = true },
})
