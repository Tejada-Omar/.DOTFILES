-- vim.keymap.set(
--   'n',
--   '<leader>tef',
--   '<Plug>PlenaryTestFile {minimal_init = "minimal_init = minimal_init.vim}"}',
--   { desc = 'Plenary Test File' }
-- )
vim.keymap.set(
  'n',
  '<leader>te',
  ":PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.vim'}<CR>",
  { desc = 'Plenary Test Directory' }
)
