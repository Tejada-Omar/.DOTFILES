vim.o.spell = true
vim.bo.textwidth = 0

vim.keymap.set('n', 'gf', function()
  if require('obsidian').util.cursor_on_markdown_link() then
    return '<cmd>ObsidianFollowLink<cr>'
  else
    return 'gf'
  end
end, { buffer = 0, expr = true })

vim.keymap.set('n', '<leader>wb', '<cmd>ObsidianBacklinks<cr>', { buffer = 0 })

vim.keymap.set(
  'n',
  '<leader>wo',
  ':ObsidianOpen',
  { buffer = 0, silent = false }
)

vim.keymap.set('n', '<leader>ws', '<cmd>ObsidianSearch<cr>', { buffer = 0 })

-- vim.keymap.set('n', '<c-space>', function()
--   local row = vim.api.nvim_win_get_cursor(0)[1] - 1
--   local cur_line = vim.api.nvim_get_current_line()
--   local todo_start, todo_end =
--       vim.regex('^\\(\\s\\)\\{-\\}-\\( \\[.\\]\\)\\?'):match_str(cur_line)
--   if todo_start == nil or todo_end == nil then return end
--
--   local todo = cur_line:sub(todo_start, todo_end)
--   local progress_start, progress_end =
--       vim.regex('\\[\\zs.\\ze\\]'):match_str(todo)
--   local progress = nil
--   local insert = true
--   if progress_start ~= nil and progress_end ~= nil then
--     progress = cur_line:sub(progress_start + 1, progress_end)
--     insert = false
--   end
--
--   if progress == nil then todo = todo .. ' [ ]' end
--   if progress == 'x' or progress == nil or progress == '-' then
--     progress = ' '
--   elseif progress == '/' then
--     progress = 'x'
--   elseif progress == ' ' then
--     progress = '/'
--   else
--     progress = 'x'
--   end
--
--   todo = todo:match('^%s*%- %[.-%]'):gsub('.%]$', progress, 1) .. ']'
--   local suffix = insert and cur_line:sub(todo:len() - 3, cur_line:len())
--       or cur_line:sub(todo:len() + 1, cur_line:len())
--   local replacement = todo .. suffix
--   vim.api.nvim_buf_set_text(0, row, 0, row, cur_line:len(), { replacement })
-- end, { buffer = 0 })
