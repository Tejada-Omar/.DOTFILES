require('nvim-autopairs').setup {
  disable_in_macro = true
}

local rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.add_rule(rule('$', '$', {'tex', 'markdown', 'vimwiki'}))
npairs.add_rule(rule('*', '*', {'markdown', 'vimwiki'}))

require('cmp').event:on(
  'confirm_done',
  require('nvim-autopairs.completion.cmp').on_confirm_done()
)
