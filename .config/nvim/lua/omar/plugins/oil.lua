return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      keymaps = {
        ['-'] = 'actions.close',
        ['<BS>'] = 'actions.parent',
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, _)
          local ignore = {
            '.git',
            'node_modules',
          }

          if vim.list_contains(ignore, name) then return true end
          return false
        end,
      },
    },
    keys = {
      { '<leader>ee', '<CMD>Oil<CR>', desc = 'Toggle Oil floating window' },
      {
        '<leader>ef',
        function() require('oil').toggle_float() end,
        desc = 'Toggle Oil floating window',
      },
    },
  },
}
