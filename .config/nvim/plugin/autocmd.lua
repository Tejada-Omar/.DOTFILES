vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank { higroup = 'IncSearch' } end,
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

    vim.lsp.inlay_hint.enable(enabled, { bufnr = 0 })
  end,
})

vim.api.nvim_create_autocmd('TermEnter', {
  callback = function(_)
    vim.cmd('startinsert')

    vim.o.number = false
    vim.o.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd('TermLeave', {
  callback = function(_)
    vim.o.number = true
    vim.o.relativenumber = true
  end,
})
