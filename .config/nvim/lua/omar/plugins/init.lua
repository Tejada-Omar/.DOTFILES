return {
  'nvim-lua/plenary.nvim',
  {
    'AckslD/nvim-FeMaco.lua',
    config = true,
  },
  {
    'andweeb/presence.nvim',
    opts = {
      auto_enable = false,
    },
  },
  {
    'ziontee113/icon-picker.nvim',
    dependencies = { 'stevearc/dressing.nvim' },
    opts = {
      disable_legacy_commands = true,
    },
    config = function()
      vim.keymap.set('n', '<leader><leader>i', '<cmd>IconPickerNormal<cr>')
      vim.keymap.set('n', '<leader><leader>y', '<cmd>IconPickerYank<cr>')
      vim.keymap.set('i', '<C-i>', '<cmd>IconPickerInsert<cr>')
    end,
  },
  {
    'mfussenegger/nvim-ansible',
  },
   {
    'Tejada-Omar/notes-compile.nvim',
    dev = false,
    ft = { 'markdown', 'vimwiki' },
    config = true,
  },
}
