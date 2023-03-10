return {
    {
        'NvChad/nvim-colorizer.lua',
        name = 'colorizer',
        opts = {
            filetypes = {
                'html',
                'css',
                'scss',
                'js',
                'ts',
                'vue',
                'svelte',
                'lua',
                'vim',
            },
            user_default_options = {
                mode = 'virtualtext',
                css = true,
                tailwind = true,
            },
        },
        config = true,
    }
}
