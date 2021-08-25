vim.cmd('autocmd BufWritePost plugins.lua source <afile> | PackerCompile')

require('options')
vim.cmd('source ~/.config/nvim/viml/mappings.vim')
vim.cmd('source ~/.config/nvim/viml/autocmds.vim')
vim.cmd('source ~/.config/nvim/viml/colorscheme.vim')
require('plugins')
