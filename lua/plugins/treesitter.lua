return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring'
        },
        build = ':TSUpdate',
        opts = {
            ensure_installed = {
                'awk',
                'bash',
                'c',
                'comment',
                'cpp',
                'css',
                'diff',
                'dockerfile',
                'go',
                'help',
                'html',
                'javascript',
                'json',
                'latex',
                'lua',
                'make',
                'markdown',
                'php',
                'python',
                'rust',
                'scss',
                'sql',
                'svelte',
                'typescript',
                'vim',
                'vue',
                'yaml'
            },
            highlight = {
                enable = true,
                disable = {
                    'markdown',
                },
            },
            indent = {
                enable = true,
            },
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
