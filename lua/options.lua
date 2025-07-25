local opt = vim.opt

opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.termguicolors = true
opt.mouse = 'a'
opt.showtabline = 2 -- always show the tabline
opt.laststatus = 3 -- global status line
opt.showmode = false
opt.cursorline = true
opt.ruler = true
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.cinoptions = ':0' -- don't indent cases in the switch block
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.scrolloff = 3
opt.splitbelow = true
opt.splitright = true

vim.o.winborder = 'rounded'
