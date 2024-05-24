require('obsidian').setup {
  dir = '~/Documents/obsidian',
  daily_notes = { folder = 'daily' },
  completion = { nvim_cmp = true },
  use_advanced_uri = true,
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix
    local suffix=''
    if title ~= nil then
      suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
    else
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.date('%Y%m%d%H%M%S')) .. '-' .. suffix
  end,
}

vim.keymap.set('n', '<leader>ww', '<cmd>ObsidianQuickSwitch<cr>')
vim.keymap.set('n', '<leader>wt', '<cmd>ObsidianToday<cr>')
vim.keymap.set('n', '<leader>wy', '<cmd>ObsidianYesterday<cr>')

vim.keymap.set('n', '<leader>wn', ':ObsidianNew', { silent = false })
