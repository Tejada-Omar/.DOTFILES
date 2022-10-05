vim.keymap.set('i', 'jk', '<Esc>')

vim.keymap.set('n', '<leader>ee', ':Explore<CR>', {silent = true})
vim.keymap.set('n', '<leader>eh', ':Hexplore<CR>', {silent = true})
vim.keymap.set('n', '<leader>ev', ':Vexplore<CR>', {silent = true})

vim.keymap.set('t', '<leader><Esc>', '<C-\\><C-n>', {silent = true})
