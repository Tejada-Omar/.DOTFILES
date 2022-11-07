-- vim.api.nvim_create_autocmd('TermOpen', {
--   callback = function() vim.cmd[[startinsert]] end
-- })

vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank { higroup = 'Visual' } end,
})
