return {
  {
    'windwp/nvim-autopairs',
    opts = { disable_in_macro = true },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)

      local rule = require('nvim-autopairs.rule')
      local npairs = require('nvim-autopairs')

      npairs.add_rule(rule('$', '$', { 'tex', 'markdown', 'vimwiki' }))
      -- Treesitter check inside tex block
      -- npairs.add_rule(rule('*', '*', {'markdown', 'vimwiki'}))

      require('cmp').event:on(
        'confirm_done',
        require('nvim-autopairs.completion.cmp').on_confirm_done()
      )
    end,
  },
}
