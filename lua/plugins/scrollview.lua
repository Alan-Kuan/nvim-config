return {
    {
        'dstein64/nvim-scrollview',
        event = 'VeryLazy',
        opts = {
            winblend = 25,
            signs_column = 1,
            signs_max_per_row = 1,
            cursor_symbol = '•',
            signs_on_startup = {
                'cursor',
                'search',
                'diagnostics',
            },
            excluded_filetypes = {
                'notify',
                'TelescopePrompt',
                'neo-tree',
                'Trouble',
                'lspinfo',
                'startuptime',
                'ccc-ui',
            },
        },
        config = function (_, opts)
            require('scrollview').setup(opts)
            vim.api.nvim_set_hl(0, 'ScrollViewSearch', { fg = 'orange' })
        end
    }
}
