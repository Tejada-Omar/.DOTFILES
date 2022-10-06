vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', '<leader>ee', ':Explore<CR>',
  {desc = 'Open netrw'})
vim.keymap.set('n', '<leader>eh', ':Hexplore<CR>',
  {desc = 'Open netrw in a horizontal split'})
vim.keymap.set('n', '<leader>ev', ':Vexplore<CR>',
  {desc = 'Open netrw in a horizontal split'})

vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-n>',
  {desc = 'Exit terminal mode'})
