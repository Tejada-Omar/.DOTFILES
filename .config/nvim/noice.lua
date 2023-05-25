vim.o.termguicolors = true
vim.cmd([[packadd packer.nvim]])
require('packer').startup(function(use)
  use {
    'folke/noice.nvim',
    config = function()
      require('noice').setup {
        messages = {
          enabled = true
        }
      }
    end,
    requires = 'MunifTanjim/nui.nvim',
  }
end)
