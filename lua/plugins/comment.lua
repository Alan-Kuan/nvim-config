return {
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
    }
}
