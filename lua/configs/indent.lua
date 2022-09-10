require('indent_blankline').setup {
    buftype_exclude = {
        'terminal',
        'nofile'
    },
    filetype_exclude = {
        'markdown',
        'txt',
        'help',
        'notify',
        'TelescopePrompt',
        'NvimTree',
        'Trouble',
        'lspinfo',
        'lsp-installer',
        'startuptime',
    }
}
