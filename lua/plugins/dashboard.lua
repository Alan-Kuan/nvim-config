return {
    {
        'glepnir/dashboard-nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'VimEnter',
        opts = {
            theme = 'doom',
            config = {
                header = {
                    '', '',
                    [[   _  _                              _            ]],
                    [[  | \| |    ___     ___    __ __    (_)    _ __   ]],
                    [[  | .` |   / -_)   / _ \   \ V /    | |   | '  \  ]],
                    [[  |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_| ]],
                    [[ _|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| ]],
                    [[ "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' ]],
                    '', '',
                },
                center = {
                    {
                        icon = '  ', desc = 'New File',
                        key = 'N', action = 'enew'
                    },
                    {
                        icon = '  ', icon_hl = 'DashboardBookmarkIcon', desc = 'Bookmarks',
                        key = 'b', action = 'Telescope marks'
                    },
                    {
                        icon = '󰍉  ', desc = 'Find File',
                        key = 'f', action = 'Telescope find_files'
                    },
                    {
                        icon = '  ', icon_hl = 'DashboardClockIcon', desc = 'Find History',
                        key = 'h', action = 'Telescope oldfiles'
                    },
                    {
                        icon = '  ', icon_hl = 'DashboardWordIcon', desc = 'Find Word',
                        key = 'g', action = 'Telescope live_grep'
                    },
                    {
                        icon = '  ', icon_hl = 'DashboardBellIcon', desc = 'Notifications',
                        key = 'n', action = 'Telescope notify'
                    },
                    {
                        icon = '  ', icon_hl = 'DashboardPaletteIcon', desc = 'Colorschemes',
                        key = 'c', action = 'Telescope colorscheme'
                    },
                    {
                        icon = '󰢛  ', icon_hl = 'DashboardAnvilIcon', desc = 'Open Mason',
                        key = 'm', action = 'Mason'
                    },
                    {
                        icon = '󰒲  ', icon_hl = 'DashboardSleepIcon', desc = 'Open Lazy',
                        key = 'l', action = 'Lazy'
                    },
                },
                footer = {
                    '', '',
                    ' Enjoy your day.'
                }
            }
        },
        config = function (_, opts)
            require('dashboard').setup(opts)

            -- Main Colors
            vim.api.nvim_set_hl(0, 'DashboardHeader',   { fg = '#42ff7b' })
            vim.api.nvim_set_hl(0, 'DashboardDesc',     { fg = '#ffffff' })
            vim.api.nvim_set_hl(0, 'DashboardKey',      { fg = '#ffc0cb' })
            vim.api.nvim_set_hl(0, 'DashboardFooter',   { fg = '#ffd062' })

            -- Icon Colors
            vim.api.nvim_set_hl(0, 'DashboardIcon',         { fg = '#ffffff' })
            vim.api.nvim_set_hl(0, 'DashboardBookmarkIcon', { fg = '#ee8438' })
            vim.api.nvim_set_hl(0, 'DashboardClockIcon',    { fg = '#b3ee8f' })
            vim.api.nvim_set_hl(0, 'DashboardWordIcon',     { fg = '#34b5d9' })
            vim.api.nvim_set_hl(0, 'DashboardBellIcon',     { fg = '#ffee30' })
            vim.api.nvim_set_hl(0, 'DashboardPaletteIcon',  { fg = '#c7ae84' })
            vim.api.nvim_set_hl(0, 'DashboardAnvilIcon',    { fg = '#bbbbbb' })
            vim.api.nvim_set_hl(0, 'DashboardSleepIcon',    { fg = '#5a85cc' })
        end
    }
}
