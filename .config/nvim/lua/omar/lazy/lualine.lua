return {
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
}
