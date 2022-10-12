require('trouble').setup {
  auto_close = true
}

vim.keymap.set('n', '<leader>x', '<cmd>TroubleToggle<CR>',
  {desc = 'Toggle Trouble view'})
