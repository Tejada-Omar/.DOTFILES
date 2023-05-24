require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.dirman'] = {
      config = {
        workspaces = {
          notes = '~/Documents/neorg',
        },
        -- default_workspace = '~/Documents/neorg',
        -- open_last_workspace = true,
      },
    },
    ['core.journal'] = {
      config = {
        workspace = '~/Documents/neorg',
      },
    },
    ['core.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.concealer'] = {
      config = {
        icon_preset = 'varied',
      },
    },
    ['core.integrations.nvim-cmp'] = {},
    ['core.integrations.telescope'] = {},
  },
}

-- TODO: Use neorg builtins
vim.keymap.set(
  'n',
  '<leader>ns',
  '<CMD>Telescope neorg insert_file_link<CR>',
  { desc = 'Insert neorg file link' }
)

vim.keymap.set(
  'n',
  '<leader>ns',
  '<CMD>Telescope neorg find_linkable<CR>',
  { desc = 'Find neorg linkable' }
)

vim.keymap.set(
  'n',
  '<leader>nh',
  '<CMD>Telescope neorg search_headings<CR>',
  { desc = 'Search neorg headings' }
)

vim.keymap.set(
  'n',
  '<leader>nw',
  '<CMD>Telescope neorg switch_workspace<CR>',
  { desc = 'Switch neorg workspaces' }
)
