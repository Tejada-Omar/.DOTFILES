return {
  {
    'akinsho/toggleterm.nvim',
    opts = {
      open_mapping = '<leader>tt',
      insert_mappings = false,
      highlights = require('rose-pine.plugins.toggleterm')
    },
    config = true,
    keys = {
      {
        '<leader>tc',
        '<CMD>ToggleTermToggleAll<CR>',
        desc = 'Toggle all terminals',
      },
    },
  },
}
