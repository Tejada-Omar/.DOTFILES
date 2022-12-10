local utils = require('omar.plugins.lsp.utils')
local null_ls = require('null-ls')
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover

require('null-ls').setup {
  sources = {
    formatting.prettierd,
    formatting.eslint_d,
    formatting.stylua,
    formatting.shfmt.with {
      extra_args = { '-i', 2, '-ci', '-sr' },
    },
    -- formatting.latexindent,
    diagnostics.eslint_d,
    diagnostics.actionlint,
    -- diagnostics.commitlint,
    -- diagnostics.shellcheck,
    -- diagnostics.luacheck.with({
    --   extra_args = { "--globals", "vim", "--std", "luajit" },
    -- }),
    code_actions.eslint_d,
    code_actions.shellcheck,
    hover.dictionary.with {
      extra_filetypes = { 'vimwiki' },
    },
  },
  on_attach = function(client, bufnr)
    utils.format_on_save(client, bufnr)
    utils.mappings(bufnr)
  end,
}
