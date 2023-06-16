local nnoremap = function (lhs, rhs)
    vim.keymap.set('n', lhs, rhs, { silent = true })
end

local vnoremap = function (lhs, rhs)
    vim.keymap.set('v', lhs, rhs, { silent = true })
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
