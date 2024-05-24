return {
  {
    { import = 'omar/plugins/dap' },
    {
      'mfussenegger/nvim-dap',
      build = ':helptags ALL',
      config = function()
        local dap = require('dap')

        vim.keymap.set(
          'n',
          '<leader>db',
          function() dap.toggle_breakpoint() end,
          { desc = 'Toggle breakpoint' }
        )

        vim.keymap.set(
          'n',
          '<leader>dl',
          function() dap.run_last() end,
          { desc = 'Run last dap command' }
        )

        vim.keymap.set(
          'n',
          '<F5>',
          function() dap.continue() end,
          { desc = 'Continue dap command' }
        )

        vim.keymap.set(
          'n',
          '<F10>',
          function() dap.step_over() end,
          { desc = 'DAP Step over next line' }
        )

        vim.keymap.set(
          'n',
          '<F11>',
          function() dap.step_into() end,
          { desc = 'DAP Step into context' }
        )

        vim.keymap.set(
          'n',
          '<F12>',
          function() dap.step_out() end,
          { desc = 'DAP Step out of context' }
        )
      end,
    },
    {
      'mrcjkb/rustaceanvim',
      build = ':helptags ALL',
      ft = 'rust',
      opts = function()
        local utils = require('omar.plugins.lsp.utils.utils')
        local on_attach = function(_, bufnr) utils.mappings(bufnr) end

        return {
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
            auto_generate_source_map = true,
          },
        }
      end,
      config = function(_, opts) vim.g.rustacenvim = opts end,
    },
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {
        'nvim-neotest/nvim-nio'
      },
      config = function()
        local dapui = require('dapui')
        dapui.setup()
      end,
    },
    { 'LiadOz/nvim-dap-repl-highlights', config = true },
    { 'leoluz/nvim-dap-go', config = true },
  },
}
