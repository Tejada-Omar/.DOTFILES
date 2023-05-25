require('trouble').setup {
  auto_open = false,
  auto_close = true,
  height = 11,
}

vim.keymap.set(
  'n',
  '<leader>xx',
  '<cmd>TroubleToggle<CR>',
  { desc = 'Toggle Trouble view' }
)

vim.keymap.set(
  'n',
  '<leader>xw',
  '<cmd>TroubleToggle workplace_diagnostics<CR>'
)

vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>')

vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<CR>')

vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<CR>')

-- vim.keymap.set(
--   'n',
--   'gr',
--   '<cmd>TroubleToggle lsp_references<CR>'
-- )

-- vim.keymap.set(
--   'n',
--   'gD',
--   '<cmd>TroubleToggle lsp_definitions<CR>'
-- )
