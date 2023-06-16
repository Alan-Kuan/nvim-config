return {
    {
        'lukas-reineke/indent-blankline.nvim',
        name = 'indent_blankline',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            buftype_exclude = {
                'terminal',
                'nofile'
            },
            filetype_exclude = {
                'markdown',
                'txt',
                'help',
                'notify',
                'TelescopePrompt',
                'neo-tree',
                'Trouble',
                'lspinfo',
                'lsp-installer',
                'startuptime',
            }
        },
    },
    {
        'echasnovski/mini.cursorword',
        event = 'VeryLazy',
        init = function ()
            vim.api.nvim_create_augroup('MiniCursorWord', { clear = true })
            vim.api.nvim_create_autocmd('Filetype', {
                group = 'MiniCursorWord',
                pattern = {
                    'markdown',
                    'txt',
                    'help',
                    'qf',  -- quickfix
                    'notify',
                    'TelescopePrompt',
                    'neo-tree',
                    'Trouble',
                    'lspinfo',
                    'lsp-installer',
                    'startuptime',
                    'dashboard',
                    'toggleterm'
                },
                callback = function ()
                    vim.b.minicursorword_disable = true
                end,
            })
        end,
        config = function ()
            require('mini.cursorword').setup {}
            vim.api.nvim_set_hl(0, 'MiniCursorWord', { bg = '#4d4531' })
        end,
    },
    {
        'echasnovski/mini.trailspace',
        event = 'VeryLazy',
        config = function ()
            require('mini.trailspace').setup {}
        end,
    },
    {
        'echasnovski/mini.surround',
        event = 'VeryLazy',
        opts = {
            custom_surroundings = {
                ['('] = { output = { left = '( ', right = ' )' } },
                ['['] = { output = { left = '[ ', right = ' ]' } },
                ['{'] = { output = { left = '{ ', right = ' }' } },
                ['<'] = { output = { left = '< ', right = ' >' } },
            },
            mappings = {
                add = 'ys',
                delete = 'ds',
                find = 'gs',
                find_left = 'gS',
                highlight = '',
                replace = 'cs',
                update_n_lines = '',
            },
        },
        config = function (_, opts)
            require('mini.surround').setup(opts)

            -- NOTE: ':' moves the cursor to command line and '<C-u>' clear the command line
            vim.keymap.set('x', 'S', ":<C-u>lua MiniSurround.add('visual')<CR>", { silent = true })
            vim.keymap.set('n', 'yss', 'ys_', { remap = true })
            vim.keymap.del('v', 'ys')
        end
    },
    {
        'echasnovski/mini.pairs',
        event = 'VeryLazy',
        opts = {
            mappings = {
                [' '] = { action = 'open', pair = '  ', neigh_pattern = '[%(%[{][%)%]}]' },
            },
        },
        config = function (_, opts)
            require('mini.pairs').setup(opts)
        end
    },
    {
        'alvan/vim-closetag',
        event = 'VeryLazy',
        config = function ()
            vim.g.closetag_filenames = '*.html, *.php, *.vue, *.svelte, *.md'
            vim.g.closetag_filetypes = 'html, php, vue, svelte, markdown'
        end
    },
    {
        'echasnovski/mini.comment',
        version = false,
        dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
        event = 'VeryLazy',
        opts = {
            hooks = {
                pre = function ()
                    require('ts_context_commentstring.internal').update_commentstring {}
                end,
            },
        },
        config = function (_, opts)
            require('mini.comment').setup(opts)
        end,
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        event = 'VeryLazy',
        opts = {
            context_commentstring = {
                enable = true,
                enable_autocmd = false,
                config = {
                    cpp = {
                        __default = '// %s'
                    },
                    c = {
                        __default = '// %s'
                    }
                }
            }
        },
        config = function (_, opts)
            require('nvim-treesitter.configs').setup(opts)
        end
    },
}
