require('nvim-treesitter.configs').setup {
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
            cpp = {
                __default = '// %s'
            },
            c = {
                __default = '// %s'
            }
        }
    }
}
