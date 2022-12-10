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
      { desc = 'Stage hunk', buffer = bufnr }
    )
    vim.keymap.set(
      { 'n', 'v' },
      '<leader>hr',
      ':Gitsigns reset_hunk<CR>',
      { desc = 'Reset hunk', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>hS',
      gs.stage_buffer,
      { desc = 'Stage buffer', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>hu',
      gs.undo_stage_hunk,
      { desc = 'Undo stage hunk', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>hR',
      gs.reset_buffer,
      { desc = 'Reset buffer', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>hp',
      gs.preview_hunk,
      { desc = 'Preview hunk', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>hb',
      function() gs.blame_line { full = true } end,
      { desc = 'Blame line', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>tb',
      gs.toggle_current_line_blame,
      { desc = 'Toggle line blame', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>hd',
      gs.diffthis,
      { desc = 'View diff', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>hD',
      function() gs.diffthis('~') end,
      { desc = 'View diff against last commit', buffer = bufnr }
    )
    vim.keymap.set(
      'n',
      '<leader>td',
      gs.toggle_deleted,
      { desc = 'Toggle deleted code', buffer = bufnr }
    )

    vim.keymap.set(
      { 'o', 'x' },
      'ih',
      ':<C-u>Gitsigns select_hunk<CR>',
      { desc = 'Select hunk', buffer = bufnr }
    )
  end,
}
