require('telescope').load_extension('notify')

vim.keymap.set('n', '<leader>ff', function () require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<leader>fg', function () require('telescope.builtin').live_grep() end)
vim.keymap.set('n', '<leader>fb', function () require('telescope.builtin').marks() end)
vim.keymap.set('n', '<leader>fh', function () require('telescope.builtin').oldfiles() end)
vim.keymap.set('n', '<leader>cc', function () require('telescope.builtin').colorscheme() end)
vim.keymap.set('n', '<leader>nc', function () require('telescope').extensions.notify.notify() end)
