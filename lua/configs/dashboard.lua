require('dashboard').setup {
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
}

-- Main Colors
vim.cmd('hi DashboardHeader     guifg=#42ff7b')
vim.cmd('hi DashboardDesc       guifg=#ffffff')
vim.cmd('hi DashboardKey        guifg=#ffc0cb')
vim.cmd('hi DashboardFooter     guifg=#ffd062')

-- Icon Colors
vim.cmd('hi DashboardIcon           guifg=#ffffff')
vim.cmd('hi DashboardBookmarkIcon   guifg=#ee8438')
vim.cmd('hi DashboardClockIcon      guifg=#b3ee8f')
vim.cmd('hi DashboardWordIcon       guifg=#34b5d9')
vim.cmd('hi DashboardBellIcon       guifg=#ffee30')
vim.cmd('hi DashboardPaletteIcon    guifg=#c7ae84')
vim.cmd('hi DashboardAnvilIcon      guifg=#bbbbbb')
vim.cmd('hi DashboardSleepIcon      guifg=#5a85cc')
