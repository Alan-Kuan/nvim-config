local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }

map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", noremap)
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", noremap)
map('n', '<leader>fb', ":lua require('telescope.builtin').marks()<CR>", noremap)
map('n', '<leader>fB', ":lua require('telescope.builtin').buffers()<CR>", noremap)
map('n', '<leader>fh', ":lua require('telescope.builtin').help_tags()<CR>", noremap)
map('n', '<leader>fH', ":lua require('telescope.builtin').oldfiles()<CR>", noremap)
map('n', '<leader>tc', ":lua require('telescope.builtin').colorscheme()<CR>", noremap)
