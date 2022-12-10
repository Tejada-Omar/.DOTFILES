vim.o.showmode = false

require('lualine').setup {
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
      {
        require('noice').api.statusline.mode.get,
        cond = require('noice').api.statusline.mode.has,
        color = { fg = '#ff9e64' },
      },
    },
    lualine_y = {
      'diff',
      'searchcount',
    },
    lualine_z = { 'location' },
  },
  inactive_sections = {},
}
