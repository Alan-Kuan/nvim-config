return {
    {
        'hoob3rt/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'VeryLazy',
        opts = {
            options = {
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
        config = function (_, opts)
            local custom_vitesse = require('lualine.themes.vitesse')
            local dark_soft_bg = '#222222'
            local dark_softer_bg = '#333333'

            custom_vitesse.normal.b.bg = dark_softer_bg
            custom_vitesse.visual.b.bg = dark_softer_bg
            custom_vitesse.insert.b.bg = dark_softer_bg
            custom_vitesse.replace.b.bg = dark_softer_bg
            custom_vitesse.command.b.bg = dark_softer_bg
            custom_vitesse.terminal.b.bg = dark_softer_bg
            custom_vitesse.inactive.b.bg = dark_softer_bg
            custom_vitesse.normal.c.bg = dark_soft_bg
            custom_vitesse.inactive.c.bg = dark_soft_bg

            opts.options.theme = custom_vitesse

            require('lualine').setup(opts)
        end
    }
}
