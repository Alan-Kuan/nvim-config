return {
    {
        'petertriho/nvim-scrollbar',
        dependencies = {
            {
                'kevinhwang91/nvim-hlslens',
                config = function()
                    require('scrollbar.handlers.search').setup {
                        override_lens = function() end,
                    }
                end,
            },
        },
        event = 'VeryLazy',
        opts = {
            marks = {
                Search = { color = 'orange' }
            }
        },
        config = true
    }
}
