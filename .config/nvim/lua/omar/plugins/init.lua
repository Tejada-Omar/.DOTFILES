return {
  'nvim-lua/plenary.nvim',
  'stevearc/dressing.nvim',
  {
    'AckslD/nvim-FeMaco.lua',
    config = true,
  },
  {
    'andweeb/presence.nvim',
    enabled = false,
  },
  {
    'ziontee113/icon-picker.nvim',
    dependencies = { 'stevearc/dressing.nvim' },
    opts = {
      disable_legacy_commands = true,
    },
    keys = {
      { '<leader><leader>i', '<CMD>IconPickerNormal<CR>' },
      { '<leader><leader>y', '<CMD>IconPickerYank<CR>' },
      { '<C-i>', '<CMD>IconPickerInsert<CR>', mode = 'i' },
    },
  },
  {
    'mfussenegger/nvim-ansible',
    ft = 'yaml',
  },
  {
    'wildfunctions/myeyeshurt',
    config = true,
  },
  {
    'Tejada-Omar/notes-compile.nvim',
    dev = false,
    ft = { 'markdown', 'vimwiki' },
    config = true,
  },
}
