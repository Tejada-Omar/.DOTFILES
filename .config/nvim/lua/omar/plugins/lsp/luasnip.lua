return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = { 'rafamadriz/friendly-snippets' },
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()

      local ls = require('luasnip')

      vim.keymap.set({ 'i', 's' }, '<C-j>', function() ls.jump(1) end)
      vim.keymap.set({ 'i', 's' }, '<C-k>', function() ls.jump(-1) end)
      vim.keymap.set({ 'i', 's' }, '<C-l>', function()
        if ls.choice_active() then ls.change_choice(1) end
      end)

      vim.keymap.set('i', '<C-h>', function()
        if ls.choice_active() then ls.change_choice(-1) end
      end)

      vim.keymap.set(
        'i',
        '<C-u>',
        function() require('luasnip.extras.select_choice')() end
      )

      vim.keymap.set(
        'n',
        '<leader><leader>s',
        '<CMD>source ~/.config/nvim/lua/omar/plugins/lsp/luasnip.lua<CR>',
        { desc = 'Source luasnips file' }
      )

      vim.keymap.set(
        { 'i', 'n' },
        '<C-f>',
        "<CMD>lua require('luasnip.extras.otf').on_the_fly()<CR>"
      )

      vim.keymap.set(
        { 'i', 'n' },
        '<C-f>q',
        "<CMD>lua require('luasnip.extras.otf').on_the_fly('q')<CR>"
      )

      vim.keymap.set(
        { 'i', 'n' },
        '<C-f>w',
        "<CMD>lua require('luasnip.extras.otf').on_the_fly('w')<CR>"
      )

      local s = ls.snippet
      local sn = ls.snippet_node
      local t = ls.text_node
      local i = ls.insert_node
      local f = ls.function_node
      local fmt = require('luasnip.extras.fmt').fmt

      local types = require('luasnip.util.types')
      ls.config.set_config {
        -- history = true,
        updateevents = 'TextChanged,TextChangedI',
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { '«', 'diffAdded' } },
            },
          },
          [types.insertNode] = {
            active = {
              virt_text = { { '●', 'diffRemoved' } },
            },
          },
        },
      }

      ls.add_snippets('markdown', {
        s(
          {
            trig = '~~~',
            dscr = 'Current working directory',
          },
          fmt('{cwd}/{}/resources/{}', {
            i(1, 'PARENT DIR'),
            i(2, 'NAME OF RESOURCE'),
            cwd = f(function() return vim.fn.getcwd() end),
          })
        ),
        s(
          {
            trig = 'startnotes',
            dscr = 'Create notes header',
          },
          fmt('# {}\n\n> Lecture {}\n\n> {date}\n\n\n', {
            i(1, 'CLASS'),
            i(2, 'NUMBER'),
            date = f(function() return os.date('%A, %B %-d, %Y') end),
          })
        ),
      })

      ls.filetype_extend('vimwiki', { 'markdown' })

      local tex = {}
      tex.in_mathzone = function()
        return vim.fn['vimtex#syntax#in_mathzone']() == 1
      end
      tex.in_text = function() return not tex.in_mathzone() end

      ls.add_snippets('tex', {
        s(
          {
            trig = 'dsp',
            desc = 'Start displaymath environment',
          },
          sn(1, {
            -- t({ "", "\\[", "", "\\]" }),
            t { '\\[', '\t' },
            i(1, ''),
            t { '', '\\]' },
          })
          -- c(1, {
          --   t("\\[\\]"),
          --   t({ "", "\\[", "", "\\]" }),
          -- })
        ),

        s({
          trig = 'subfile',
          desc = 'Add subfile preamble',
        }, {
          t { '\\documentclass[master.tex]{subfiles}', '\\begin{document}', '' },
          i(0, ''),
          t { '', '\\end{document}' },
        }),

        s(
          {
            trig = 'todo',
            desc = 'Enter an inline TODO',
          },
          sn(1, {
            t { '\\todo[inline]{' },
            i(1, ''),
            t { '}' },
          })
        ),

        s({
          trig = 'set',
          desc = 'Enter set',
        }, {
          t { '\\{' },
          i(1, ''),
          t { '\\}' },
        }, { condition = tex.in_mathzone }),

        s({
          trig = 'ordered pair',
          desc = 'Enter ordered pair',
        }, {
          t { '\\langle ' },
          i(1, ''),
          t { '\\rangle' },
        }, { condition = tex.in_mathzone }),
      })
    end,
  },
}
