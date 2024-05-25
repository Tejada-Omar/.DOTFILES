return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      disable_in_macro = true,
    },
    config = function(_, opts)
      require('nvim-autopairs').setup(opts)

      local rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')
      local npairs = require('nvim-autopairs')

      npairs.add_rule(
        rule('$', '$', { 'tex', 'markdown', 'vimwiki' }):with_move(cond.none())
      )

      npairs.get_rules("'")[1].not_filetypes = { 'tex' }
      -- Treesitter check inside tex block
      -- npairs.add_rule(rule('*', '*', {'markdown', 'vimwiki'}))

      require('cmp').event:on(
        'confirm_done',
        require('nvim-autopairs.completion.cmp').on_confirm_done()
      )
    end,
  },
}
