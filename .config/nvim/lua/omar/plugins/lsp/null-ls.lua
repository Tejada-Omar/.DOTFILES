local utils = require('omar.plugins.lsp.utils')
local null_ls = require('null-ls')
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover

require('null-ls').setup {
  sources = {
    formatting.prettierd,
    require('none-ls.formatting.eslint_d'),
    formatting.stylua,
    formatting.shfmt.with {
      extra_args = { '-i', 2, '-ci', '-sr' },
    },
    require('none-ls.formatting.latexindent'),
    diagnostics.textidote.with {
      '--read-all',
      '--output',
      'singleline',
      '--no-color',
      '--quiet',
      '$FILENAME',
    },
    require('none-ls.diagnostics.eslint_d'),
    diagnostics.actionlint,
    diagnostics.commitlint,
    require('none-ls-shellcheck.diagnostics'),
    require('none-ls-luacheck.diagnostics.luacheck').with({
      extra_args = { "--globals", "vim", "--std", "luajit" },
    }),
    require('none-ls.code_actions.eslint_d'),
    require('none-ls-shellcheck.code_actions'),
    hover.dictionary.with {
      extra_filetypes = { 'vimwiki' },
    },
  },
  on_attach = function(client, bufnr)
    -- utils.format_on_save(client, bufnr)
    utils.mappings(bufnr)
  end,
}
