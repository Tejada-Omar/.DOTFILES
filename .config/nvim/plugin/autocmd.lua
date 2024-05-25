vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank { higroup = 'Visual' } end,
})

vim.api.nvim_create_autocmd({ 'LspAttach', 'InsertEnter', 'InsertLeave' }, {
  callback = function(args)
    local enabled = args.event ~= 'InsertEnter'
    if
      vim.tbl_isempty(vim.lsp.get_clients {
        bufnr = 0,
        method = vim.lsp.protocol.Methods.textDocument_inlayHint,
      })
    then
      enabled = false
    end

    vim.lsp.inlay_hint.enable(0, enabled)
  end,
})
