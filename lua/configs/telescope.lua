local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }

require('telescope').load_extension('notify')

map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", noremap)
map('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", noremap)
map('n', '<leader>fb', ":lua require('telescope.builtin').marks()<CR>", noremap)
map('n', '<leader>fh', ":lua require('telescope.builtin').oldfiles()<CR>", noremap)
map('n', '<leader>cc', ":lua require('telescope.builtin').colorscheme()<CR>", noremap)
map('n', '<leader>nc', ":lua require('telescope').extensions.notify.notify()<CR>", noremap)
