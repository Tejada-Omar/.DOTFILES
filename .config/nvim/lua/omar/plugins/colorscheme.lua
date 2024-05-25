return {
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
    config = true,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = true,
  },
  {
    'Everblush/nvim',
    name = 'everblush',
    lazy = false,
    priority = 1000,
    config = true,
  },
}
