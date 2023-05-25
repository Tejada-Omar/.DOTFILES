require('icon-picker').setup {
  disable_legacy_commands = true,
}

vim.keymap.set('n', '<leader><leader>i', '<cmd>IconPickerNormal<cr>')
vim.keymap.set('n', '<leader><leader>y', '<cmd>IconPickerYank<cr>')
vim.keymap.set('i', '<C-i>', '<cmd>IconPickerInsert<cr>')
