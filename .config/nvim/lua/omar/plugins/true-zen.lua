local truezen = require('true-zen')

truezen.setup {
  integrations = {
    twilight = true,
    lualine = true,
  },
}

vim.keymap.set('n', '<leader>zn', function()
  local last = vim.api.nvim_buf_line_count(0)
  truezen.narrow(0, last)
end, { desc = 'true-zen narrow' })

vim.keymap.set('v', '<leader>zn', function()
  local first = vim.fn.line('v')
  local last = vim.fn.line('.')
  truezen.narrow(first, last)
end, { desc = 'true-zen narrow' })

vim.keymap.set('n', '<leader>zf', truezen.focus, { desc = 'true-zen focus' })
vim.keymap.set(
  'n',
  '<leader>zm',
  truezen.minimalist,
  { desc = 'true-zen minimalist' }
)
vim.keymap.set(
  'n',
  '<leader>za',
  truezen.ataraxis,
  { desc = 'true-zen ataraxis' }
)
