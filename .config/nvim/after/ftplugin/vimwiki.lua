vim.keymap.set(
  'n',
  '<leader>m',
  function() vim.bo.filetype = 'markdown' end,
  { desc = 'Switch filetype to markdown' }
)
vim.o.spell = true
