vim.keymap.set('i', 'jk', '<Esc>')

-- vim.keymap.set('n', '<leader>te', '<Plug>PlenaryTestFile')
vim.keymap.set(
  'n',
  '<leader>te',
  ":PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.vim'}<CR>"
)

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

vim.keymap.set('n', '<leader>ee', ':Explore<CR>', { desc = 'Open netrw' })
vim.keymap.set(
  'n',
  '<leader>eh',
  ':Hexplore<CR>',
  { desc = 'Open netrw in a horizontal split' }
)
vim.keymap.set(
  'n',
  '<leader>ev',
  ':Vexplore<CR>',
  { desc = 'Open netrw in a horizontal split' }
)

vim.keymap.set(
  't',
  '<leader><Esc>',
  '<C-\\><C-n>',
  { desc = 'Exit terminal mode' }
)
