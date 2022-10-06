return require('packer').startup(function(use)
  use {
    'nvim-lua/popup.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }

  use {
    {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('omar.plugins.treesitter') end
    },
    {'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter'},
    {'nvim-treesitter/nvim-treesitter-context', after = 'nvim-treesitter'}
  }

  use {
    {
      'neovim/nvim-lspconfig',
      event = 'BufRead',
      config = function() require('omar.plugins.lsp.servers') end,
      requires = {'hrsh7th/cmp-nvim-lsp'}
    },
    {
      'hrsh7th/nvim-cmp',
      config = function() require('omar.plugins.lsp.nvim-cmp') end,
      requires = {
        'L3MON4D3/LuaSnip',
        config = function() require('omar.plugins.lsp.luasnip') end,
        requires = {'rafamadriz/friendly-snippets'}
      }
    },
    {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp'},
    {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
    {'hrsh7th/cmp-path', after = 'nvim-cmp'},
    {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'},
  }

  use {
    'windwp/nvim-autopairs',
    event = 'InsertCharPre',
    after = 'nvim-cmp',
    config = function() require('omar.plugins.autopairs') end
  }

  use {
    'folke/tokyonight.nvim',
    config = function() require('omar.plugins.tokyonight') end
  }

  use {
    'nvim-lualine/lualine.nvim',
    after = 'tokyonight.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function() require('omar.plugins.lualine') end
  }

  use {
    'lervag/vimtex',
    ft = 'tex',
    config = function() require('omar.plugins.vimtex') end
  }

  use {
    {
      'nvim-telescope/telescope.nvim',
      event = 'BufWinEnter',
      config = function() require('omar.plugins.telescope') end,
      requires = {'nvim-lua/plenary.nvim'}
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      after = 'telescope.nvim',
      run = 'make',
      config = function() require('telescope').load_extension('fzf') end
    }
  }

  use {
      'numToStr/Comment.nvim',
      event = 'BufWinEnter',
      config = function() require('omar.plugins.comment') end,
      requires = 'JoosepAlviste/nvim-ts-context-commentstring'
  }

  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufWinEnter',
    config = function() require('omar.plugins.colorizer') end
  }

  use {
    'vimwiki/vimwiki',
    config = function() require('omar.plugins.vimwiki') end
  }

  use {
    'kyazdani42/nvim-web-devicons',
    config = function() require('nvim-web-devicons').setup() end
  }

  use {
    'iamcco/markdown-preview.nvim',
    ft = {'markdown', 'vimwiki'},
    run = function() vim.fn['mkdp#util#install']() end,
    config = function() require('omar.plugins.markdown-preview') end
  }

  use {
   'mcauley-penney/tidy.nvim',
   event = 'BufWritePre',
   config = function() require('tidy').setup() end
  }

  use {
    'kylechui/nvim-surround',
    config = function() require('nvim-surround').setup() end
  }

  use {
    'folke/which-key.nvim',
    config = function() require('omar.plugins.which-key') end
  }
end)
