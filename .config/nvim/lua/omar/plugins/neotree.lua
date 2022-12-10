vim.cmd([[let g:neo_tree_remove_legacy_commands = 1]])

vim.keymap.set(
  'n',
  '<leader>el',
  ':Neotree toggle reveal<CR>',
  { desc = 'Toggle neotree' }
)

vim.keymap.set(
  'n',
  '<leader>ee',
  ':Neotree toggle current reveal_force_cwd<CR>',
  { desc = 'Toggle neotree force change directory' }
)

vim.keymap.set(
  'n',
  '<leader>ef',
  ':Neotree focus<CR>',
  { desc = 'Toggle neotree force change directory' }
)

require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['o'] = 'system_open',
      },
    },
    commands = {
      system_open = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        vim.api.nvim_command(string.format('silent !xdg-open "%s"', path))
      end,
    },
  },
  event_handlers = {
    -- {
    --   event = 'file_opened',
    --   handler = function() require('neo-tree').close_all() end,
    -- },
    {
      event = 'neo_tree_buffer_enter',
      handler = function() vim.cmd('highlight! Cursor blend=100') end,
    },
    {
      event = 'neo_tree_buffer_leave',
      handler = function() vim.cmd('highlight! Cursor guibg=#c0caf5 blend=0') end,
    },
  },
}

-- require('neo-tree').paste_default_config()
