return {
  {
    'akinsho/toggleterm.nvim',
    opts = function()
      local config = {
        open_mapping = '<leader>tt',
        insert_mappings = false,
        shade_terminals = false,
      }

      if vim.g.lualine_theme == 'rose-pine' then
        vim.tbl_extend('error', config, {
          highlights = require('rose-pine.plugins.toggleterm'),
        })
      end

      return config
    end,
    config = true,
    keys = {
      { '<leader>tt', desc = 'Open toggleterm' },
      {
        '<leader>tc',
        '<CMD>ToggleTermToggleAll<CR>',
        desc = 'Toggle all terminals',
      },
    },
  },
}
