return {
  {
    {
      'mfussenegger/nvim-dap',
      build = ':helptags ALL',
      keys = {
        {
          '<leader>db',
          '<CMD>DapToggleBreakpoint<CR>',
          desc = 'Toggle breakpoint',
        },
        {
          '<leader>dl',
          function() require('dap').run_last() end,
          desc = 'Run last dap command',
        },
        {
          '<F5>',
          '<CMD>DapContinue<CR>',
          desc = 'Continue dap debugging',
        },
        {
          '<F10>',
          '<CMD>DapStepOver<CR>',
          desc = 'Step over next line for DAP',
        },
        {
          '<F11>',
          '<CMD>DapStepInto<CR>',
          desc = 'Step into inner context for DAP',
        },
        {
          '<F12>',
          '<CMD>DapStepOut<CR>',
          desc = 'Step out of context for DAP',
        },
      },
    },
    {
      'mrcjkb/rustaceanvim',
      build = ':helptags ALL',
      init = function()
        vim.g.rustacenvim = function()
          local on_attach = function(_, bufnr)
            local utils = require('omar.plugins.lsp.utils.utils')
            utils.mappings(bufnr)
          end

          return {
            server = {
              on_attach = on_attach,
              cmd = function()
                local mason_reg = require('mason-registry')
                local ra = mason_reg.is_installed('rust-analyzer')
                    and mason_reg
                      .get_package('rust-analyzer')
                      :get_install_path() .. '/rust-analyzer'
                  or 'rust-analyzer'

                return { ra }
              end,
              default_settings = {
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
        end
      end,
    },
    {
      'rcarriga/nvim-dap-ui',
      event = 'VeryLazy',
      dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
      },
      config = function()
        local dapui = require('dapui')
        dapui.setup()
      end,
    },
    { 'LiadOz/nvim-dap-repl-highlights', config = true },
    { 'leoluz/nvim-dap-go', ft = 'go', config = true },
  },
}
