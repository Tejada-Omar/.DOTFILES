local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local colorscheme = 'rose-pine'
vim.g.lualine_theme = colorscheme

require('lazy').setup({ import = 'omar/plugins' }, {
  lazy = true,
  dev = {
    path = '~/Code/projects/neovim',
    fallback = true,
  },
  change_detection = {
    notify = false,
  },
})

vim.cmd.colorscheme(colorscheme)
