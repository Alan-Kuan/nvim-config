require('lualine').setup {
    options = {
        theme = 'gruvbox',
        disabled_filetypes = { 'toggleterm' }
    },
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
                'diagnostics', sources = { 'nvim_lsp' }, symbols = {
                    error = ' ',
                    warn = ' ',
                    info = ' ',
                    hint = ''
                }
            },
            'filename'
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    extensions = { 'nvim-tree' }
}
