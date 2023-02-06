local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('lazy', {
  defaults = {
    version = nil,
  },
  dev = {
    path = '~/Code',
    patterns = { 'Tejada-Omar' },
  },
  install = {
    colorscheme = {'tokyonight'}
  },
  custom_keys = {
    ['<localleader>tl'] = function (plugin)
      require('lazy.util').float_term(nil, {
        cwd = plugin.dir
      })
    end
  }

})
