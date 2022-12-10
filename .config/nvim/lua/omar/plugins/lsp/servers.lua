local lsp = require('lspconfig')
local utils = require('omar.plugins.lsp.utils')

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

vim.keymap.set(
  'n',
  '<Space>e',
  vim.diagnostic.open_float,
  { desc = 'Open diagnostic' }
)
vim.keymap.set(
  'n',
  '<C-n>',
  vim.diagnostic.goto_next,
  { desc = 'Move to next diagnostic' }
)
vim.keymap.set(
  'n',
  '<C-p>',
  vim.diagnostic.goto_prev,
  { desc = 'Move to previous diagnostic' }
)
-- vim.kepmap.set('n', '<space>q', vim.diagnostic.setloclist)

local on_attach = function(client, bufnr) utils.mappings(bufnr) end

vim.lsp.set_log_level(vim.lsp.log_levels.OFF)

vim.diagnostic.config {
  virtual_text = { spacing = 1 },
  signs = false,
  underline = true,
}

lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      telemetry = { enable = false },
    },
  },
}

lsp.marksman.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    'markdown',
    'vimwiki',
  },
}

-- Look into .get_mappings()
local language_servers = {
  'pyright',
  'texlab',
  'cssls',
  'html',
  'jsonls',
  'bashls',
  'tsserver',
  'kotlin_language_server',
  'vimls',
  'lemminx',
}

for _, server in pairs(language_servers) do
  lsp[server].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end
