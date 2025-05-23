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
nnoremap('<C-n>', function() vim.fn.setreg('/', '') end, 'Clear search register')

-- select all
nnoremap('<leader>a', 'ggVG', 'Select all')
-- copy to the system clipboard
vnoremap('<leader>y', '"+y', 'Copy to the system clipboard')
-- paste from the system clipboard
nnoremap('<leader>p', '"+p', 'Paste from the system clipboard')
vnoremap('<leader>p', '"+p', 'Paste from the system clipboard')
nnoremap('<leader>P', '"+P', 'Paste from the system clipboard')
vnoremap('<leader>P', '"+P', 'Paste from the system clipboard')

-- remove default LSP-related mappings
vim.keymap.del('n', 'gra')
vim.keymap.del('n', 'grn')
vim.keymap.del('n', 'grr')
vim.keymap.del('n', 'gri')
vim.keymap.del('n', 'gO')
