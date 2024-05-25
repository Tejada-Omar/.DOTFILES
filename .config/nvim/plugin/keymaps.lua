vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set(
  'n',
  '<leader>bn',
  ':bnext!<CR>',
  { desc = 'Go to next buffer in buffer list' }
)

vim.keymap.set(
  'n',
  '<leader>bp',
  ':bprevious!<CR>',
  { desc = 'Go to previous buffer in buffer list' }
)

vim.keymap.set(
  'n',
  '<leader>bsn',
  ':sbnext!<CR>',
  { desc = 'Split window and go to next buffer in buffer list' }
)

vim.keymap.set(
  'n',
  '<leader>bsp',
  ':sbprevious!<CR>',
  { desc = 'Split window and go to previous buffer in buffer list' }
)

vim.keymap.set(
  't',
  '<Esc><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)

vim.keymap.set('n', '<Space>l', '<CMD>Lazy<CR>', { desc = 'Open Lazy config' })
