return {
  {
    'nvim-tree/nvim-web-devicons',
    config = true,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      style = 'night',
      terminal_colors = false,
      lualine_bold = true,
      on_highlights = function(highlights, _)
        highlights.Folded = highlights.Conceal
      end,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      vim.cmd.colorscheme('tokyonight')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'UIEnter',
    opts = function()
      vim.o.showmode = false

      return {
        options = {
          icons_enabled = false,
          globalstatus = true,
          theme = 'tokyonight',
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
      }
    end,
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
