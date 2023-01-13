require('toggleterm').setup {
  open_mapping = '<leader>tt',
  insert_mappings = false,
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  git = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  on_open = function(term)
    vim.cmd('startinsert')
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = term.bufnr })
  end,
  on_close = function(term) vim.cmd('startinsert') end,
}

function _lazygit_toggle() lazygit:toggle() end

vim.keymap.set(
  'n',
  '<leader>g',
  '<cmd>lua _lazygit_toggle()<cr>',
  { desc = 'Open lazygit' }
)

vim.keymap.set(
  'n',
  '<leader>tc',
  '<cmd>ToggleTermToggleAll<cr>',
  { desc = 'Toggle all terminals' }
)
