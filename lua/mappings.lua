local function nnoremap(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { desc = desc, silent = true })
end
local function vnoremap(lhs, rhs, desc)
  vim.keymap.set('v', lhs, rhs, { desc = desc, silent = true })
end

-- set mapleader
vim.g.mapleader = ' '

-- reset behavior of space
nnoremap('<space>', '<nop>')

-- clear search register
nnoremap('<C-n>', function()
    vim.fn.setreg('/', '')
  end, 'Clear search register')

-- select all
nnoremap('<leader>a', 'ggVG', 'Select all')
-- copy to the system clipboard
nnoremap('<leader>yy', '"+yy', 'Copy to the system clipboard')
vnoremap('<leader>y', '"+y', 'Copy to the system clipboard')
-- cut to the system clipboard
nnoremap('<leader>x', '"+x', 'Cut to the system clipboard')
vnoremap('<leader>x', '"+x', 'Cut to the system clipboard')
nnoremap('<leader>dd', '"+dd', 'Cut to the system clipboard')
vnoremap('<leader>d', '"+d', 'Cut to the system clipboard')
nnoremap('<leader>D', '"+D', 'Cut to the system clipboard')
vnoremap('<leader>D', '"+D', 'Cut to the system clipboard')
-- paste from the system clipboard
nnoremap('<leader>p', '"+p', 'Paste from the system clipboard')
vnoremap('<leader>p', '"+p', 'Paste from the system clipboard')
nnoremap('<leader>P', '"+P', 'Paste from the system clipboard')
vnoremap('<leader>P', '"+P', 'Paste from the system clipboard')
