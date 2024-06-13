return {
  { import = 'omar/plugins/lsp' },
  {
    'williamboman/mason.nvim',
    config = true,
    dependencies = { 'nvim-telescope/telescope.nvim' },
  },
}
