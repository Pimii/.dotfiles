MiniDeps.add('rebelot/kanagawa.nvim')

require('kanagawa').setup({
  compile = true,
  commentStyle = { italic = false },
  keywordStyle = { italic = false },
  theme = 'dragon',
  background = {
    dark = 'dragon',
    light = 'lotus',
  },
})

vim.cmd('colorscheme kanagawa')
