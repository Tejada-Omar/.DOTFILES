return {
  {
    'nvimtools/none-ls.nvim',
    main = 'null-ls',
    lazy = false,
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
      'gbprod/none-ls-shellcheck.nvim',
      'gbprod/none-ls-luacheck.nvim',
    },
    opts = function()
      local utils = require('omar.plugins.lsp.utils.utils')
      local null_ls = require('null-ls')
      local diagnostics = null_ls.builtins.diagnostics
      local formatting = null_ls.builtins.formatting
      local hover = null_ls.builtins.hover

      return {
        sources = {
          formatting.prettierd,
          formatting.black,
          require('none-ls.formatting.eslint_d'),
          formatting.stylua,
          formatting.shfmt.with {
            extra_args = { '-i', 2, '-ci', '-sr' },
          },
          require('none-ls.formatting.latexindent'),
          formatting.goimports,
          formatting.goimports_reviser,
          formatting.golines.with {
            '--shorten-comments',
          },
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
          diagnostics.golangci_lint,
          -- diagnostics.commitlint,
          require('none-ls-shellcheck.diagnostics'),
          require('none-ls-luacheck.diagnostics.luacheck').with {
            extra_args = { '--globals', 'vim', '--std', 'luajit' },
          },
          require('none-ls.code_actions.eslint_d'),
          require('none-ls-shellcheck.code_actions'),
          hover.dictionary.with {
            extra_filetypes = { 'vimwiki' },
          },
          diagnostics.ansiblelint,
          diagnostics.protolint,
        },

        on_attach = function(_, bufnr)
          -- utils.format_on_save(client, bufnr)
          utils.mappings(bufnr)
        end,
      }
    end,
  },
}
