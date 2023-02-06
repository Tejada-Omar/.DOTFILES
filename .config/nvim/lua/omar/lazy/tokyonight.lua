return {
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
}
