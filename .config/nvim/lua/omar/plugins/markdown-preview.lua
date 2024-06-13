return {
  {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown', 'vimwiki' },
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    init = function()
      vim.cmd('let g:mkdp_echo_preview_url = 1')
      vim.cmd("let g:mkdp_theme = 'dark'")
    end,
    build = function() vim.fn['mkdp#util#install']() end,
    keys = {
      {
        '<C-s>',
        '<Plug>MarkdownPreviewToggle',
        desc = 'Preview Markdown in browser',
      },
    },
  },
}
