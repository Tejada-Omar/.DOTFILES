require('gitsigns').setup {
  signcolumn = false,
  numhl = true,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'Goto next hunk' })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true, desc = 'Goto previous hunk', buffer = bufnr })

    vim.keymap.set(
      { 'n', 'v' },
      '<leader>hs',
      ':Gitsigns stage_hunk<CR>',
      { buffer = bufnr }
    )
    vim.keymap.set(
      { 'n', 'v' },
      '<leader>hr',
      ':Gitsigns reset_hunk<CR>',
      { buffer = bufnr }
    )
    vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr })
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr })
    vim.keymap.set(
      'n',
      '<leader>hb',
      function() gs.blame_line { full = true } end,
      { buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>tb',
      gs.toggle_current_line_blame,
      { buffer = bufnr }
    )
    vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr })
    vim.keymap.set(
      'n',
      '<leader>hD',
      function() gs.diffthis('~') end,
      { buffer = bufnr }
    )
    vim.keymap.set('n', '<leader>td', gs.toggle_deleted, { buffer = bufnr })

    vim.keymap.set(
      { 'o', 'x' },
      'ih',
      ':<C-u>Gitsigns select_hunk<CR>',
      { buffer = bufnr }
    )
  end,
}
