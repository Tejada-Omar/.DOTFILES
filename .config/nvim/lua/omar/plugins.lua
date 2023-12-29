local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')
      .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path,
    }
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use('wbthomason/packer.nvim')

  use('nanotee/luv-vimdocs')
  use('milisims/nvim-luaref')
  use('nvim-lua/plenary.nvim')

  use {
    'nvim-lua/popup.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    disable = true,
  }

  use {
    'folke/noice.nvim',
    config = function() require('omar.plugins.noice') end,
    disable = true,
    requires = {
      'MunifTanjim/nui.nvim',
    },
  }

  use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function() require('omar.plugins.treesitter') end,
    },
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      after = 'nvim-treesitter',
    },
    -- { 'nvim-treesitter/nvim-treesitter-context', after = 'nvim-treesitter' },
    { 'nvim-treesitter/playground',              after = 'nvim-treesitter' },
  }

  use {
    {
      'williamboman/mason.nvim',
      config = function() require('mason').setup() end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      config = function() require('mason-lspconfig').setup() end,
      after = 'mason.nvim',
    },
    {
      'neovim/nvim-lspconfig',
      -- event = 'BufRead',
      config = function() require('omar.plugins.lsp.servers') end,
      requires = { 'hrsh7th/cmp-nvim-lsp' },
      after = 'mason-lspconfig.nvim',
    },
    {
      'jose-elias-alvarez/null-ls.nvim',
      config = function() require('omar.plugins.lsp.null-ls') end,
    },
    {
      'hrsh7th/nvim-cmp',
      config = function() require('omar.plugins.lsp.nvim-cmp') end,
      requires = {
        'L3MON4D3/LuaSnip',
        config = function() require('omar.plugins.lsp.luasnip') end,
        requires = { 'rafamadriz/friendly-snippets' },
      },
    },
    { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-buffer',       after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path',         after = 'nvim-cmp', disable = true },
    { 'hrsh7th/cmp-cmdline',      after = 'nvim-cmp' },
    {
      'windwp/nvim-autopairs',
      -- event = 'InsertCharPre',
      after = 'nvim-cmp',
      config = function() require('omar.plugins.autopairs') end,
    },
    {
      'j-hui/fidget.nvim',
      tag = 'legacy',
      -- event = 'BufWinEnter',
      config = function() require('fidget').setup() end,
      -- disable = true,
    },
  }

  use {
    {
      'nvim-tree/nvim-web-devicons',
      config = function() require('nvim-web-devicons').setup() end,
    },
    {
      'folke/tokyonight.nvim',
      config = function() require('omar.plugins.tokyonight') end,
    },
    {
      'nvim-lualine/lualine.nvim',
      after = 'tokyonight.nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function() require('omar.plugins.lualine') end,
    },
    {
      'norcalli/nvim-colorizer.lua',
      -- event = 'BufWinEnter',
      config = function() require('omar.plugins.colorizer') end,
    },
  }

  use {
    'lervag/vimtex',
    config = function() require('omar.plugins.vimtex') end,
  }

  use {
    {
      'nvim-telescope/telescope.nvim',
      -- event = 'BufWinEnter',
      config = function() require('omar.plugins.telescope') end,
      requires = { 'nvim-lua/plenary.nvim' },
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
      config = function() require('telescope').load_extension('fzf') end,
    },
    {
      'protex/better-digraphs.nvim',
      after = 'telescope.nvim',
      config = function() require('omar.plugins.digraphs') end,
      disable = true,
    },
  }

  use {
    {
      'numToStr/Comment.nvim',
      -- event = 'BufWinEnter',
      config = function() require('omar.plugins.comment') end,
      requires = 'JoosepAlviste/nvim-ts-context-commentstring',
    },
    {
      'kylechui/nvim-surround',
      config = function() require('nvim-surround').setup() end,
    },
  }

  use {
    'nvim-neorg/neorg',
    -- tag = '*',
    run = ':Neorg sync-parsers',
    -- ft = 'norg',
    after = 'nvim-treesitter',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-neorg/neorg-telescope',
    },
    config = function() require('omar.plugins.neorg') end,
  }

  use {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown', 'vimwiki' },
    run = function() vim.fn['mkdp#util#install']() end,
    config = function() require('omar.plugins.markdown-preview') end,
  }

  use {
    'mcauley-penney/tidy.nvim',
    -- event = 'BufWritePre',
    config = function() require('tidy').setup() end,
  }

  use {
    'folke/which-key.nvim',
    config = function() require('omar.plugins.which-key') end,
  }

  use {
    'akinsho/toggleterm.nvim',
    tag = '*',
    config = function() require('omar.plugins.toggleterm') end,
  }

  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    config = function() require('omar.plugins.trouble') end,
  }

  use {
    'AckslD/nvim-FeMaco.lua',
    after = 'nvim-treesitter',
    config = function() require('femaco').setup() end,
  }

  use {
    'mfussenegger/nvim-jdtls',
    ft = 'java',
    config = function() require('omar.plugins.lsp.jdtls') end,
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('omar.plugins.gitsigns') end,
  }

  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function() require('omar.plugins.neotree') end,
  }

  use {
    'MunifTanjim/nui.nvim',
  }

  use {
    {
      -- '~/Code/eyeliner.nvim',
      'jinh0/eyeliner.nvim',
      config = function() require('omar.plugins.eyeliner') end,
      disable = true,
    },
    {
      'lukas-reineke/indent-blankline.nvim',
      config = function() require('indent_blankline').setup() end,
      disable = true,
    },
  }

  use {
    'tamton-aquib/zone.nvim',
    config = function() require('zone').setup() end,
    disable = true,
  }

  use {
    {
      'Pocco81/true-zen.nvim',
      config = function() require('omar.plugins.true-zen') end,
    },
    {
      'folke/twilight.nvim',
      config = function() require('twilight').setup() end,
    },
  }

  use {
    'andweeb/presence.nvim',
    config = function() require('presence').setup { auto_enable = false } end,
  }

  use {
    -- '~/Code/obsidian.nvim',
    'epwalsh/obsidian.nvim',
    after = 'vimwiki',
    config = function() require('omar.plugins.obsidian') end,
  }

  use {
    'vimwiki/vimwiki',
    config = function() require('omar.plugins.vimwiki') end,
  }

  use {
    'echasnovski/mini.nvim',
    config = function() require('mini.align').setup() end,
  }

  use {
    'ziontee113/icon-picker.nvim',
    requires = 'stevearc/dressing.nvim',
    config = function () require('omar.plugins.icon-picker') end,
    disable = true
  }

  -- use {
  --   'mfussenegger/nvim-dap',
  --   run = ':helptags ALL'
  -- }

  -- Local plugins
  use {
    '~/Code/notes-compile.nvim',
    -- 'Tejada-Omar/notes-compile.nvim',
    ft = { 'markdown', 'vimwiki' },
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('omar.plugins.notes-compile') end,
  }

  if packer_bootstrap then require('packer').sync() end
end)
