return {
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown', 'vimwiki' },
    build = function() vim.fn['mkdp#util#install']() end,
    config = function()
      vim.keymap.set(
        'n',
        '<C-s>',
        '<Plug>MarkdownPreviewToggle',
        { desc = 'Preview Markdown in browser' }
      )
    end,
  },
}
