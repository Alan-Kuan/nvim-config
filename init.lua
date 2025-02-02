require('config')
require('options')
require('mappings')

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
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

require('lazy').setup({
  spec = {
    { import = 'plugins' },
    { import = 'plugins.coding' },
    { import = 'plugins.coding.lsp' },
    { import = 'plugins.ft' },
    { import = 'plugins.ui' },
    { import = 'plugins.misc' },
  },
  install = {
    colorscheme = {
      'ayu',
      'everforest',
    },
  },
})

-- Note: it depends on plenary.nvim, so it should be required after lazy.nvim
require('follow-system-theme')
