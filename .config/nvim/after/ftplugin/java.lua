vim.bo.textwidth = 120
-- vim.bo.tabstop = 4
-- vim.bo.shiftwidth = 4

local run_maven = function()
  local root_dir = vim.fs.dirname(
    vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]
  )

  vim.cmd([[9TermExec cmd='mvn javafx:run' dir=]] .. root_dir)
end

vim.keymap.set(
  'n',
  '<leader>tj',
  function() run_maven() end,
  { desc = 'Run maven javafx:run' }
)
