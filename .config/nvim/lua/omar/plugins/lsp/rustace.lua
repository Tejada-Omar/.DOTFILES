local utils = require('omar.plugins.lsp.utils')
local on_attach = function(client, bufnr) utils.mappings(bufnr) end

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    settings = {
      ['rust-analyzer'] = {
        procMacro = {
          enable = true,
          ignored = {
            ['async-trait'] = { 'async_trait' },
            ['napi-derive'] = { 'napi' },
            ['async-recursion'] = { 'async_recursion' },
          },
        },
      },
    },
  },
  dap = {
    auto_generate_source_map = true
  },
}
