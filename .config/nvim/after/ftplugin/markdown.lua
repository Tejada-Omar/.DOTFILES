vim.keymap.set(
  'n',
  '<leader>m',
  function() vim.bo.filetype = 'vimwiki' end,
  { desc = 'Switch filetype to vimwiki' }
)
vim.o.spell = true

vim.bo.textwidth = 0
vim.bo.tabstop = 2
vim.bo.softtabstop = -1
vim.bo.shiftwidth = 2
