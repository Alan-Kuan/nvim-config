return {
    {
        'hoob3rt/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'VeryLazy',
        opts = {
            options = {
                theme = 'gruvbox',
                disabled_filetypes = { 'help', 'qf', 'Trouble' }
            },
            extensions = { 'neo-tree', 'toggleterm' },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = {
                    'branch',
                    {
                        'diff',
                        symbols = {
                            added = '',
                            modified = ' ',
                            removed = ''
                        }
                    }
                },
                lualine_c = {
                    {
                        'diagnostics',
                        sources = { 'nvim_diagnostic' },
                        symbols = {
                            error = ' ',
                            warn = ' ',
                            info = ' ',
                            hint = ''
                        }
                    },
                    {
                        'filename',
                        path = 3,
                        symbols = {
                            modified = ' ',
                            readonly = '  ',
                        }
                    }
                },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_c = {
                    {
                        'filename',
                        path = 3,
                        symbols = {
                            modified = ' ',
                            readonly = '  ',
                        }
                    }
                },
                lualine_x = { 'location' }
            },
        },
    }
}
