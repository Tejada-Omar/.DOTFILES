return {
  {
    'folke/noice.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' },
    opts = {
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      cmdline = {
        view = 'cmdline',
      },
      messages = {
        -- enabled = true,
        enabled = false,
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            kind = 'search_count',
          },
          opts = { skip = true },
        },
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },
    },
    config = true,
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    init = function() vim.o.showmode = false end,
    opts = {
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
          -- {
          --   require('noice').api.statusline.mode.get,
          --   cond = require('noice').api.statusline.mode.has,
          --   color = { fg = '#ff9e64' },
          -- },
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
    'jinh0/eyeliner.nvim',
    enabled = false,
    opts = {
      highlight_on_key = true,
    },
    config = true,
  },
  {
    'folke/tokyonight',
    opts = {
      style = 'night',
      terminal_colors = false,
      lualine_bold = true,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)

      vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
          vim.api.nvim_set_hl(0, 'Folded', { bg = 'bg', fg = '#565f89' })
        end,
      })
    end,
  },
  {
    'norcalli/nvim-colorizer.lua',
    opts = {
      '*',
      '!markdown',
      '!vimwiki',
    },
    config = true,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    config = true,
  },
  {
    'Pocco81/true-zen.nvim',
    opts = {
      integrations = {
        twilight = true,
        lualine = true,
      },
    },
    config = true,
  },
}
