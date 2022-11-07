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
    lualine_x = { 'filetype', 'progress' },
    lualine_y = { 'diff' },
    lualine_z = { 'location' },
  },
  inactive_sections = {},
}
