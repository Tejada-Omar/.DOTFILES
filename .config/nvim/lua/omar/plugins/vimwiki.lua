return {
  {
    'vimwiki/vimwiki',
    ft = { 'markdown', 'vimwiki' },
    init = function()
      vim.g['vimwiki_list'] = {
        {
          path = '~/Documents/notes',
          syntax = 'markdown',
          ext = '.md',
        },
        {
          path = '~/Documents/school/2022-FALL/PHIL-279',
          syntax = 'markdown',
          ext = '.md',
        },
        {
          path = '~/Documents/school/2022-FALL/GEOG-254',
          syntax = 'markdown',
          ext = '.md',
        },
        {
          path = '~/Documents/school/2023-WINTER/CPSC-355',
          syntax = 'markdown',
          ext = '.md',
        },
        {
          path = '~/Documents/school/2023-WINTER/PHIL-264',
          syntax = 'markdown',
          ext = '.md',
        },
      }

      vim.g['vimwiki_key_mappings'] = {
        global = 0,
        links = 0,
        html = 0,
        mouse = 1,
      }

      vim.g.vimwiki_listsyms = ' /x'
      vim.g.vimwiki_folding = 'custom'
      vim.g.vimwiki_global_ext = 1
    end,
  },
}
