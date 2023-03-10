return {
    {
        'lukas-reineke/indent-blankline.nvim',
        name = 'indent_blankline',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
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
                'neo-tree',
                'Trouble',
                'lspinfo',
                'lsp-installer',
                'startuptime',
            }
        },
        config = true,
    }
}
