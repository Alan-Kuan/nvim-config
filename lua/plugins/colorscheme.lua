return {
    {
        'morhetz/gruvbox',
        lazy = false,
        priority = 1000,
        init = function ()
            vim.cmd('colorscheme gruvbox')

            local function update_highlight(name, hl)
                local old_hl = vim.api.nvim_get_hl(0, { name = name })
                local new_hl = vim.tbl_extend('force', old_hl, hl)
                vim.api.nvim_set_hl(0, name, new_hl)
            end

            -- Word
            vim.api.nvim_set_hl(0, 'Visual', { bg = '#31474d' })
            vim.api.nvim_set_hl(0, 'Search', { bg = '#5f3c25' })
            vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#5f3c25' })

            -- Comment
            update_highlight('Comment', { italic = true })

            -- Sign Column
            vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })

            -- HTML/Markdown
            update_highlight('htmlItalic', { italic = true })
            update_highlight('htmlBoldItalic', { italic = true })
            update_highlight('htmlUnderlineItalic', { italic = true })
            update_highlight('htmlBoldUnderlineItalic', { italic = true })
        end
    }
}
