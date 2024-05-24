local bd = require('better-digraphs')

vim.keymap.set('i', '<C-v><C-k>', function() bd.digraphs('insert') end)
vim.keymap.set('n', 'r<C-v><C-k>', function() bd.digraphs('normal') end)
vim.keymap.set('v', 'r<C-v><C-k>', function() bd.digraphs('visual') end)
