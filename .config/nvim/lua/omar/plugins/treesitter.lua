return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    lazy = false,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    opts = function()
      vim.o.foldmethod = 'expr'
      vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

      return {
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { 'markdown' },
          disable = { 'latex' }, -- For vimtex
        },
        incremental_selection = { enable = true },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ic'] = '@class.inner',
              ['ac'] = '@class.outer',
              ['iC'] = '@call.inner',
              ['aC'] = '@call.outer',
              ['il'] = '@loop.inner',
              ['al'] = '@loop.outer',
              ['ii'] = '@conditional.inner',
              ['ai'] = '@conditional.outer',
              ['iP'] = '@parameter.inner',
              ['aP'] = '@parameter.outer',
            },
            selection_modes = {
              ['@parameter.outer'] = 'v',
              ['@function.outer'] = 'V',
              ['@class.outer'] = '<c-v>',
            },
            include_surrounding_whitespace = false,
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      }
    end,
  },
}
