return {
  {
    'folke/tokyonight.nvim',
    enabled = false,
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
    'rose-pine/neovim',
    name = 'rose-pine',
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function(_, opts)
      require('rose-pine').setup(opts)
      vim.cmd.colorscheme('rose-pine')
    end,
  },
}
