local bd = require('better-digraphs')

vim.keymap.set('i', '<C-v><C-k>', function() bd.digraphs('i') end)

vim.keymap.set('n', 'r<C-v><C-k>', function() bd.digraphs('r') end)

vim.keymap.set('v', 'r<C-v><C-k>', function() bd.digraphs('gvr') end)
