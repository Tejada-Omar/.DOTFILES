local dap = require('dap')

vim.keymap.set(
  'n',
  '<leader>db',
  function() dap.toggle_breakpoint() end,
  { desc = 'Toggle breakpoint' }
)
vim.keymap.set(
  'n',
  '<leader>dl',
  function() dap.run_last() end,
  { desc = 'Run last dap command' }
)
vim.keymap.set(
  'n',
  '<F5>',
  function() dap.continue() end,
  { desc = 'Continue dap command' }
)
vim.keymap.set(
  'n',
  '<F10>',
  function() dap.step_over() end,
  { desc = 'DAP Step over next line' }
)
vim.keymap.set(
  'n',
  '<F11>',
  function() dap.step_into() end,
  { desc = 'DAP Step into context' }
)
vim.keymap.set(
  'n',
  '<F12>',
  function() dap.step_out() end,
  { desc = 'DAP Step out of context' }
)

local dapui = require('dapui')
dapui.setup()

-- dap.listeners.before.attach.dapui_config = function() dapui.open() end

-- dap.listeners.before.launch.dapui_config = function() dapui.open() end

-- dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end

-- dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

vim.keymap.set(
  'n',
  '<leader>dt',
  function() dapui.toggle() end,
  { desc = 'Toggle dap ui' }
)
