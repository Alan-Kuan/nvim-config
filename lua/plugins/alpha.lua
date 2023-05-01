return {
    {
        'goolord/alpha-nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'VimEnter',
        opts = function()
            local dashboard = require('alpha.themes.dashboard')

            -- Content
            dashboard.section.header.val = {
                [[   _  _                              _            ]],
                [[  | \| |    ___     ___    __ __    (_)    _ __   ]],
                [[  | .` |   / -_)   / _ \   \ V /    | |   | '  \  ]],
                [[  |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_| ]],
                [[ _|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| ]],
                [[ "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' ]],
            }
            dashboard.section.buttons.val = {
                dashboard.button('N', ' ' .. ' New File',      '<Cmd>enew <Bar> startinsert<CR>'),
                dashboard.button('b', ' ' .. ' Bookmarks',     '<Cmd>Telescope marks<CR>'),
                dashboard.button('f', ' ' .. ' Find File',     '<Cmd>Telescope find_files<CR>'),
                dashboard.button('r', ' ' .. ' Recent Files',  '<Cmd>Telescope oldfiles<CR>'),
                dashboard.button('g', ' ' .. ' Find text',     '<Cmd>Telescope live_grep<CR>'),
                dashboard.button('n', ' ' .. ' Notifications', '<Cmd>Telescope notify<CR>'),
                dashboard.button('c', ' ' .. ' Colorschemes',  '<Cmd>Telescope colorscheme<CR>'),
                dashboard.button('m', '󰢛 ' .. ' Mason',         '<Cmd>Mason<CR>'),
                dashboard.button('l', '󰒲 ' .. ' Lazy',          '<Cmd>Lazy<CR>'),
                dashboard.button('q', ' ' .. ' Quit',          '<Cmd>qa<CR>'),
            }
            dashboard.section.footer.val = {
                '', '',
                ' Enjoy your day.'
            }

            -- Highlightings
            dashboard.section.header.opts.hl = 'AlphaHeader'

            local icon_highlights = {
                'AlphaIcon',
                'AlphaBookmarkIcon',
                'AlphaIcon',
                'AlphaClockIcon',
                'AlphaWordIcon',
                'AlphaBellIcon',
                'AlphaPaletteIcon',
                'AlphaAnvilIcon',
                'AlphaSleepIcon',
                'AlphaIcon',
            }
            for idx, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = icon_highlights[idx]
                button.opts.hl_shortcut = 'AlphaShortcut'
            end

            dashboard.section.footer.opts.hl = 'AlphaFooter'

            return dashboard
        end,
        config = function(_, dashboard)
            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == 'lazy' then
                vim.cmd.close()
                vim.api.nvim_create_autocmd('User', {
                    pattern = 'AlphaReady',
                    callback = function()
                        require('lazy').show()
                    end,
                })
            end

            require('alpha').setup(dashboard.opts)

            -- Main Colors
            vim.api.nvim_set_hl(0, 'AlphaHeader',   { fg = '#42ff7b' })
            vim.api.nvim_set_hl(0, 'AlphaShortcut', { fg = '#ffc0cb' })
            vim.api.nvim_set_hl(0, 'AlphaFooter',   { fg = '#ffd062' })

            -- Icon Colors
            vim.api.nvim_set_hl(0, 'AlphaIcon',         { fg = '#ffffff' })
            vim.api.nvim_set_hl(0, 'AlphaBookmarkIcon', { fg = '#ee8438' })
            vim.api.nvim_set_hl(0, 'AlphaClockIcon',    { fg = '#b3ee8f' })
            vim.api.nvim_set_hl(0, 'AlphaWordIcon',     { fg = '#34b5d9' })
            vim.api.nvim_set_hl(0, 'AlphaBellIcon',     { fg = '#ffee30' })
            vim.api.nvim_set_hl(0, 'AlphaPaletteIcon',  { fg = '#c7ae84' })
            vim.api.nvim_set_hl(0, 'AlphaAnvilIcon',    { fg = '#bbbbbb' })
            vim.api.nvim_set_hl(0, 'AlphaSleepIcon',    { fg = '#5a85cc' })
        end,
    },
}
