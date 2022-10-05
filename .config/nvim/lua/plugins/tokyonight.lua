require('tokyonight').setup({
  style = "night",
  terminal_colors = false,
  lualine_bold = true
})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = '*',
  callback = function() vim.api.nvim_set_hl(0, 'Folded', {bg = 'bg', fg = '#565f89'}) end
})

vim.cmd[[colorscheme tokyonight-night]]
