return {
  {
    'narutoxy/silicon.lua',
    requires = { 'nvim-lua/plenary.nvim' },
    opts = {
      output = '/home/omar/Pictures/Silicon/SILICON-${year}-${month}-${date}-${time}.png',
    },
    config = function()
      vim.keymap.set(
        'v',
        '<leader>zs',
        function() require('silicon').visualise_api {} end,
        { desc = 'Generate screenshot of visual selection' }
      )

      vim.keymap.set(
        'v',
        '<leader>zb',
        function()
          require('silicon').visualise_api { to_clip = true, show_buf = true }
        end,
        {
          desc = 'Generate screenshot of buffer with visual selection highlighted',
        }
      )

      vim.keymap.set(
        'n',
        '<leader>zs',
        function()
          require('silicon').visualise_api { to_clip = true, visible = true }
        end,
        { desc = 'Generate screenshot of visible portion of buffer' }
      )

      vim.keymap.set(
        'n',
        '<leader>zb',
        function() require('silicon').visualise_api { to_clip = true } end,
        { desc = 'Generate screenshot of current buffer line' }
      )
    end,
  },
}
