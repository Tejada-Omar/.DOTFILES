return {
  {
    'nvim-tree/nvim-web-devicons',
    config = true,
  },
  {
    'folke/tokyonight.nvim',
    priority = 1000,
    init = function ()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
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
      'Pocco81/true-zen.nvim',
      opts = {
        integrations = {
          twilight = true,
          lualine = true,
        },
      },
      config = function(_, opts)
        local truezen = require('true-zen')

        require('true-zen').setup(opts)

        vim.keymap.set('n', '<leader>zn', function()
          local last = vim.api.nvim_buf_line_count(0)
          truezen.narrow(0, last)
        end, { desc = 'true-zen narrow' })

        vim.keymap.set('v', '<leader>zn', function()
          local first = vim.fn.line('v')
          local last = vim.fn.line('.')
          truezen.narrow(first, last)
        end, { desc = 'true-zen narrow' })

        vim.keymap.set(
          'n',
          '<leader>zf',
          truezen.focus,
          { desc = 'true-zen focus' }
        )
        vim.keymap.set(
          'n',
          '<leader>zm',
          truezen.minimalist,
          { desc = 'true-zen minimalist' }
        )
        vim.keymap.set(
          'n',
          '<leader>za',
          truezen.ataraxis,
          { desc = 'true-zen ataraxis' }
        )
      end,
    },
    {
      'folke/twilight.nvim',
      config = true,
    },
  },
}
