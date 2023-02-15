vim.keymap.set('n', '<leader>zn', function()
  local last = vim.api.nvim_buf_line_count(0)
  require('true-zen').narrow(0, last)
end, { desc = 'true-zen narrow' })

vim.keymap.set('v', '<leader>zn', function()
  local first = vim.fn.line('v')
  local last = vim.fn.line('.')
  require('true-zen').narrow(first, last)
end, { desc = 'true-zen narrow' })

vim.keymap.set(
  'n',
  '<leader>zf',
  require('true-zen').focus,
  { desc = 'true-zen focus' }
)
vim.keymap.set(
  'n',
  '<leader>zm',
  require('true-zen').minimalist,
  { desc = 'true-zen minimalist' }
)
vim.keymap.set(
  'n',
  '<leader>za',
  require('true-zen').ataraxis,
  { desc = 'true-zen ataraxis' }
)

return {
  {
    'Pocco81/true-zen.nvim',
    opts = {
      integrations = {
        twilight = true,
        lualine = true,
      },
    },
    config = true,
  },
}
