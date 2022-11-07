vim.keymap.set(
  'n',
  '<leader>m',
  function() vim.bo.filetype = 'vimwiki' end,
  { desc = 'Switch filetype to vimwiki' }
)
vim.o.spell = true
