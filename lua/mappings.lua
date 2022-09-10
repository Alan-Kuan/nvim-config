local nnoremap = function (lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { silent = true })
end

local vnoremap = function (lhs, rhs)
    vim.keymap.set('v', lhs, rhs, { silent = true })
end

local tnoremap = function (lhs, rhs)
    vim.keymap.set('t', lhs, rhs, { silent = true })
end

-- set mapleader
vim.g.mapleader = ' '

-- reset behavior of space
nnoremap('<space>', '<nop>')

-- clear search register
nnoremap('<C-n>', function ()
    vim.fn.setreg('/', '')
end)

-- switch between light/dark colorscheme
nnoremap('<leader>bg', function ()
    vim.o.background = vim.o.background == 'dark' and 'light' or 'dark'
    -- FIXME: should reload other highlighting
end)

-- for jumping between split screen to be easier
nnoremap('<C-j>', '<C-w>j')
nnoremap('<C-k>', '<C-w>k')
nnoremap('<C-h>', '<C-w>h')
nnoremap('<C-l>', '<C-w>l')
tnoremap('<C-j>', '<C-\\><C-n><C-w>j')
tnoremap('<C-k>', '<C-\\><C-n><C-w>k')
tnoremap('<C-h>', '<C-\\><C-n><C-w>h')
tnoremap('<C-l>', '<C-\\><C-n><C-w>l')
-- resize split
nnoremap('<M-j>', '<C-w>+')
nnoremap('<M-k>', '<C-w>-')
nnoremap('<M-h>', '<C-w><')
nnoremap('<M-l>', '<C-w>>')

-- select all
nnoremap('<leader>a',   'ggVG')
-- copy to the system clipboard
nnoremap('<leader>yy',  '"+yy')
vnoremap('<leader>y',   '"+y')
-- cut to the system clipboard
nnoremap('<leader>x',   '"+x')
vnoremap('<leader>x',   '"+x')
nnoremap('<leader>dd',  '"+dd')
vnoremap('<leader>d',   '"+d')
nnoremap('<leader>D',   '"+D')
vnoremap('<leader>D',   '"+D')
-- paste from the system clipboard
nnoremap('<leader>p',   '"+p')
vnoremap('<leader>p',   '"+p')
nnoremap('<leader>P',   '"+P')
vnoremap('<leader>P',   '"+P')
