MiniDeps.add('neovim/nvim-lspconfig')
-- require'lspconfig'.pyright.setup{}

local key_mapping = function()
  vim.keymap.set('n', 'gd', function()
    vim.lsp.buf.definition({ reuse_win = true })
  end, { noremap = true, silent = true, desc = 'Goto definition' })

  vim.keymap.set('n', 'gr', function()
    vim.lsp.buf.references()
  end, { noremap = true, silent = true, desc = 'Goto references' })

  vim.keymap.set('n', 'gD', function()
    vim.lsp.buf.declaration()
  end, { noremap = true, silent = true, desc = 'Goto declaration' })

  vim.keymap.set('n', 'gI', function()
    vim.lsp.buf.implementation({ reuse_win = true })
  end, { noremap = true, silent = true, desc = 'Goto implementation' })

  vim.keymap.set('n', 'gy', function()
    vim.lsp.buf.type_definition({ reuse_win = true })
  end, { noremap = true, silent = true, desc = 'Goto type definition' })

  vim.keymap.set('n', 'K', function()
    vim.lsp.buf.hover()
  end, { noremap = true, silent = true, desc = 'Hover' })

  vim.keymap.set('n', 'gK', function()
    vim.lsp.buf.signature_help()
  end, { noremap = true, silent = true, desc = 'Signature help' })

  vim.keymap.set('i', '<C-k>', function()
    vim.lsp.buf.signature_help()
  end, { noremap = true, silent = true, desc = 'Signature help' })

  vim.keymap.set('n', '<leader>ca', function()
    vim.lsp.buf.code_action()
  end, { noremap = true, silent = true, desc = 'Code action' })

  vim.keymap.set('v', '<leader>ca', function()
    vim.lsp.buf.code_action()
  end, { noremap = true, silent = true, desc = 'Code action' })
end

vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
      switch_source_header(bufnr)
    end, { desc = 'Switch between source/header' })

    vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdShowSymbolInfo', function()
      symbol_info()
    end, { desc = 'Show symbol info' })

    key_mapping()
  end,
})

vim.lsp.enable('bashls')
vim.lsp.config('bashls', {
  on_attach = function()
    key_mapping()
  end,
})

vim.lsp.enable('basedpyright')
vim.lsp.config('basedpyright', {
  on_attach = function()
    key_mapping()
  end,
})

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
        },
      },
    })
  end,
  on_attach = function()
    key_mapping()
  end,
  settings = {
    Lua = {},
  },
})

vim.lsp.enable('zls')
vim.lsp.config('zls', {
  on_attach = function()
    key_mapping()
  end,
})
