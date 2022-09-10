require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = {
            'markdown',
        },
    },
    indent = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}
