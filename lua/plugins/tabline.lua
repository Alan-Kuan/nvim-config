return {
    {
        'seblj/nvim-tabline',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = 'VeryLazy',
        opts = {
            no_name = '[New File]',   -- Name for buffers with no name
            modified_icon = '',      -- Icon for showing modified buffer
            close_icon = '',         -- Icon for closing tab with mouse
            separator = '▌',          -- Separator icon on the left side
            padding = 1,              -- Prefix and suffix space
            color_all_icons = false,  -- Color devicons in active and inactive tabs
            right_separator = false,  -- Show right separator on the last tab
            show_index = false,       -- Shows the index of tab before filename
            show_icon = true,         -- Shows the devicon
        },
        config = function (_, opts)
            local tabline_bg = '#444444'
            local tabline_fill_bg = '#555555'
            local modified_fg = '#fcba03'
            -- get background color of highlight group Normal
            local normal_bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID('Normal')), 'bg#')

            vim.api.nvim_set_hl(0, 'TabLineFill', { bg = tabline_fill_bg })

            vim.api.nvim_set_hl(0, 'TabLine', { bg = tabline_bg, underline = false })
            vim.api.nvim_set_hl(0, 'TabLineModified', { fg = modified_fg, bg = tabline_bg })

            vim.api.nvim_set_hl(0, 'TabLineSel', { bg = normal_bg })
            vim.api.nvim_set_hl(0, 'TabLineModifiedSel', { fg = modified_fg, bg = normal_bg })
            vim.api.nvim_set_hl(0, 'TabLineSeparatorSel', { fg = 'skyblue', bg = normal_bg })

            require('tabline').setup(opts)
        end
    }
}
