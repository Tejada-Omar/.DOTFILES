return {
  {
    'nvim-tree/nvim-web-devicons',
    config = true,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function() vim.cmd([[colorscheme tokyonight-night]]) end,
    opts = function()
      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          vim.api.nvim_set_hl(0, 'Folded', { bg = 'bg', fg = '#565f89' })
        end,
      })

      return {
        style = 'night',
        terminal_colors = false,
        lualine_bold = true,
      }
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
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
    config = true,
  },
  {
    'folke/which-key.nvim',
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
    },
    {
      'folke/twilight.nvim',
      config = true,
    },
  },
}