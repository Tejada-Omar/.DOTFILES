local builtin = require('telescope.builtin')

require('telescope').setup {
  defaults = {
    prompt_prefix = ' ',
    selection_caret = '  ',
    entry_prefix = ' ',
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top',
    },
    mappings = {
      i = {
        ['<leader><cr>'] = 'file_edit',
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = 'smart_case',
      },
    },
  },
  pickers = {
    live_grep = {
      grep_open_files = true,
    },
  },
}

vim.keymap.set(
  'n',
  '<leader>ff',
  builtin.find_files,
  { desc = 'Fuzzy-find files' }
)
vim.keymap.set(
  'n',
  '<leader>fg',
  builtin.live_grep,
  { desc = 'Live-grep files' }
)
vim.keymap.set(
  'n',
  '<leader>fb',
  builtin.buffers,
  { desc = 'Fuzzy-find buffers' }
)
vim.keymap.set(
  'n',
  '<leader>fh',
  builtin.help_tags,
  { desc = 'Fuzzy-find help tags' }
)
vim.keymap.set(
  'n',
  '<leader>fo',
  builtin.oldfiles,
  { desc = 'Fuzzy-find old files' }
)
