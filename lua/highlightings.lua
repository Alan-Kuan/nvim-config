local function update_highlight(name, hl)
    local old_hl = vim.api.nvim_get_hl_by_name(name, true)
    local new_hl = vim.tbl_extend('force', old_hl, hl)
    vim.api.nvim_set_hl(0, name, new_hl)
end

-- Word
vim.api.nvim_set_hl(0, 'Visual', { bg = '#31474d' })
vim.api.nvim_set_hl(0, 'Search', { bg = '#314d34' })
vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#314d34' })

-- Comment
update_highlight('Comment', { italic = true })

-- Markdown
update_highlight('htmlItalic', { italic = true })
update_highlight('htmlBoldItalic', { italic = true })
update_highlight('htmlUnderlineItalic', { italic = true })
update_highlight('htmlBoldUnderlineItalic', { italic = true })
