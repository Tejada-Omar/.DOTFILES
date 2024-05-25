return {
  {
    'nvim-tree/nvim-web-devicons',
    config = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'UIEnter',
    init = function() vim.o.showmode = false end,
    opts = {
      options = {
        icons_enabled = false,
        globalstatus = true,
        theme = vim.g.lualine_theme,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'branch' },
        lualine_x = {
          'filetype',
          'progress',
        },
        lualine_y = {
          'diff',
          'searchcount',
        },
        lualine_z = { 'location' },
      },
      inactive_sections = {},
    },
  },
  {
    'mcauley-penney/tidy.nvim',
    event = 'BufWrite',
    config = true,
  },
  {
    'folke/which-key.nvim',
    event = 'UIEnter',
    opts = {
      plugins = {
        spelling = {
          enabled = true,
        },
      },
      window = {
        border = 'double',
        position = 'bottom',
      },
    },
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        backdrop = 1,
        options = {
          list = true,
        },
      },
      plugins = {
        options = {
          ruler = true,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = true },
        tmux = { enabled = true },
      },
    },
    keys = {
      { '<leader>z', '<CMD>ZenMode<CR>', desc = 'Toggle zen mode' },
    },
    dependencies = {
      {
        'folke/twilight.nvim',
        config = true,
      },
    },
  },
}
