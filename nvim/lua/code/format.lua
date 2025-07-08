MiniDeps.add('stevearc/conform.nvim')

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    c = { 'clang_format' },
    cpp = { 'clang_format' },
    sh = { 'shellcheck' },
    json = { 'jq' },
    ['_'] = { 'trim_whitespace' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.zig', '*.zon' },
  callback = function()
    vim.lsp.buf.format()
  end,
})
