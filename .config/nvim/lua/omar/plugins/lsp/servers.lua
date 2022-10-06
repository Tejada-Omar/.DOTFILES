local lsp = require('lspconfig')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

vim.keymap.set('n', '<Space>e', vim.diagnostic.open_float,
  {desc = 'Open diagnostic'})
vim.keymap.set('n', '<C-n>', vim.diagnostic.goto_next,
  {desc = 'Move to next diagnostic'})
vim.keymap.set('n', '<C-p>', vim.diagnostic.goto_prev,
  {desc = 'Move to previous dianostic'})
-- vim.kepmap.set('n', '<space>q', vim.diagnostic.setloclist)

local on_attach = function(client, bufnr)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
    {desc = 'Jump to function declaration'})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition,
    {desc = 'Jump to function definition'})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover,
    {desc = 'Show hover information in floating window'})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation,
    {desc = 'List all implementations in quickfix window'})
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help,
    {desc = 'Display signature info in floating window'})
  vim.keymap.set('n', '<Space>wa', vim.lsp.buf.add_workspace_folder,
    {desc = 'Add folder to workspace folders'})
  vim.keymap.set('n', '<Space>wr', vim.lsp.buf.remove_workspace_folder,
    {desc = 'Remove folder from workspace folders'})
  vim.keymap.set('n', '<Space>wl',
    function() vim.pretty_print(vim.lsp.buf.list_workspace_folders()) end,
    {desc = 'List workspace windows'})
  vim.keymap.set('n', '<Space>D', vim.lsp.buf.type_definition,
    {desc = 'Jump to type definition'})
  vim.keymap.set('n', '<Space>rn', vim.lsp.buf.rename,
    {desc = 'Rename all references to symbol'})
  vim.keymap.set('n', '<Space>ca', vim.lsp.buf.code_action,
    {desc = 'Select an available code action'})
  vim.keymap.set('n', 'gr', vim.lsp.buf.references,
    {desc = 'List all references to symbol in quickfix window'})
  vim.keymap.set('n', '<Space>f', function() vim.lsp.buf.format {async = true} end,
    {desc = 'Format a buffer using attached LSP'})
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
