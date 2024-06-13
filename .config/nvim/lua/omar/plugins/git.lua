return {
  {
    'lewis6991/gitsigns.nvim',
    event = 'UIEnter',
    opts = {
      signcolumn = false,
      numhl = true,
      current_line_blame_opts = {
        ignore_whitespace = true,
      },
    },
    keys = {
      {
        ']c',
        function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            require('gitsigns').nav_hunk { 'next' }
          end
        end,
        desc = 'Move to next diff hunk',
        buffer = 0,
      },
      {
        '[c',
        function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            require('gitsigns').nav_hunk { 'prev' }
          end
        end,
        desc = 'Move to prev diff hunk',
        buffer = 0,
      },
      {
        '<leader>hs',
        '<CMD>Gitsigns stage_hunk<CR>',
        mode = { 'n', 'v' },
        desc = 'Stage hunk',
        buffer = 0,
      },
      {
        '<leader>hr',
        '<CMD>Gitsigns reset_hunk<CR>',
        mode = { 'n', 'v' },
        desc = 'Reset hunk',
        buffer = 0,
      },
      {
        '<leader>hS',
        '<CMD>Gitsigns stage_buffer<CR>',
        desc = 'Stage entire buffer',
        buffer = 0,
      },
      {
        '<leader>hu',
        '<CMD>Gitsigns undo_stage_hunk<CR>',
        desc = 'Undo stage hunk',
        buffer = 0,
      },
      {
        '<leader>hR',
        '<CMD>Gitsigns reset_buffer<CR>',
        desc = 'Reset entire buffer',
        buffer = 0,
      },
      {
        '<leader>hp',
        '<CMD>Gitsigns preview_hunk<CR>',
        desc = 'Preview hunk',
        buffer = 0,
      },
      {
        '<leader>hb',
        function() require('gitsigns').blame_line { full = true } end,
        desc = 'Blame line',
        buffer = 0,
      },
      {
        '<leader>tb',
        '<CMD>Gitsigns toggle_current_line_blame<CR>',
        desc = 'Toggle current line blame',
        buffer = 0,
      },
      {
        '<leader>td',
        '<CMD>Gitsigns toggle_deleted<CR>',
        desc = 'Toggle deleted code',
        buffer = 0,
      },
      {
        'ih',
        '<CMD>Gitsigns select_hunk<CR>',
        mode = { 'o', 'x' },
        desc = 'Select hunk',
        buffer = 0,
      },
    },
  },
  {
    'NeogitOrg/neogit',
    event = 'VeryLazy',
    keys = { { '<leader>g', '<CMD>Neogit<CR>', desc = 'Open Neogit' } },
    opts = {
      commit_editor = {
        staged_diff_split_kind = 'auto',
      },
    },
    dependencies = {
      {
        'sindrets/diffview.nvim',
        opts = {
          enhanced_diff_hl = true,
        },
        keys = {
          { '<leader>hd', '<CMD>DiffviewOpen<CR>', desc = 'Open diffview' },
        },
      },
      'nvim-telescope/telescope.nvim',
    },
  },
}
