return {
  {
    'akinsho/toggleterm.nvim',
    opts = {
      open_mapping = '<leader>tt',
      insert_mappings = false,
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
