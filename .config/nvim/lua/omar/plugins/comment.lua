return {
  {
    'numToStr/Comment.nvim',
    config = true,
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        config = function()
          vim.g.skip_ts_context_commentstring_module = true
          ---@diagnostic disable-next-line: missing-fields
          require('ts_context_commentstring').setup {}
        end,
      },
    },
  },
  {
    'kylechui/nvim-surround',
    config = true,
  },
}
