return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'rcarriga/nvim-notify',
        },
        event = 'VeryLazy',
        config = function ()
            -- NOTE: cannot put setup's argument into the 'opts' field since it contains `require('telescope.actions')`
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ['<Esc>'] = require('telescope.actions').close
                        }
                    }
                }
            }
            require('telescope').load_extension('notify')

            vim.keymap.set('n', '<leader>ff', function () require('telescope.builtin').find_files() end)
            vim.keymap.set('n', '<leader>fg', function () require('telescope.builtin').live_grep() end)
            vim.keymap.set('n', '<leader>fb', function () require('telescope.builtin').marks() end)
            vim.keymap.set('n', '<leader>fh', function () require('telescope.builtin').oldfiles() end)
            vim.keymap.set('n', '<leader>cc', function () require('telescope.builtin').colorscheme() end)
            vim.keymap.set('n', '<leader>nc', function () require('telescope').extensions.notify.notify() end)
        end
    }
}
