local lsp = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<C-n>', vim.diagnostic.goto_next)
vim.keymap.set('n', '<C-p>', vim.diagnostic.goto_prev)
-- vim.kepmap.set('n', '<space>q', vim.diagnostic.setloclist)

local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
  vim.keymap.set('n', '<Space>wa', vim.lsp.buf.add_workspace_folder)
  vim.keymap.set('n', '<Space>wr', vim.lsp.buf.remove_workspace_folder)
  vim.keymap.set('n', '<Space>wl', function()
    vim.pretty_print(vim.lsp.buf.list_workspace_folders())
  end)
  vim.keymap.set('n', '<Space>D', vim.lsp.buf.type_definition)
  vim.keymap.set('n', '<Space>rn', vim.lsp.buf.rename)
  vim.keymap.set('n', '<Space>ca', vim.lsp.buf.code_action)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references)
  vim.keymap.set('n', '<Space>f', function() vim.lsp.buf.format {async = true} end)
end

vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

vim.diagnostic.config({
  virtual_text = {spacing = 1},
  signs = false,
  underline = true
})

lsp.sumneko_lua.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {version = 'LuaJIT'},
      diagnostics = {globals = {'vim'}},
      workspace = {library = vim.api.nvim_get_runtime_file('', true)},
      telemetry = {enable = false}
    }
  }
})

local language_servers = {
  'pyright',
  'texlab',
  'cssls',
  'html',
  'jsonls',
  'bashls',
  'tsserver',
  'java_language_server',
  'kotlin_language_server'
}

for _, server in ipairs(language_servers) do
  lsp[server].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end
