require('neorg').setup {
  load = {
    ['core.defaults'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          notes = '~/Documents/neorg',
        },
        -- default_workspace = '~/Documents/neorg',
        -- open_last_workspace = true,
      },
    },
    ['core.norg.journal'] = {
      config = {
        workspace = '~/Documents/neorg',
      },
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.norg.concealer'] = {
      config = {
        icon_preset = 'varied',
      },
    },
    ['core.integrations.nvim-cmp'] = {},
    ['core.integrations.telescope'] = {},
  },
}
