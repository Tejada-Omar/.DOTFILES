vim.keymap.set(
  'n',
  '<leader>x',
  '<cmd>TroubleToggle<CR>',
  { desc = 'Toggle Trouble view' }
)

return {
  {
    'folke/trouble.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = { auto_close = true },
    config = true,
    keys = { '<leader>x' },
  },
}
