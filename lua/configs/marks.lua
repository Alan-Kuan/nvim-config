require('marks').setup {
    default_mappings = true,
    mappings = {},
    excluded_filetypes = {
        '',  -- nvim-cmp's tooltip's filetype is ''
        'toggleterm',
        'notify',
        'TelescopePrompt',
        'NvimTree',
        'Trouble',
        'lspinfo',
        'lsp-installer',
        'startuptime',
    },
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = {
        builtin = 8,
        lower = 10,
        upper = 15,
        bookmark = 20
    },
    builtin_marks = { ".", "<", ">", "^" },
    bookmark_1 = {
        sign = ' ',
        annotate = true,
    },
    bookmark_2 = {
        sign = ' ',
        annotate = true,
    },
    bookmark_3 = {
        sign = ' ',
        annotate = true,
    },
    bookmark_4 = {
        sign = ' ',
        annotate = true,
    },
    bookmark_5 = {
        sign = ' ',
        annotate = true,
    },
    bookmark_6 = {
        sign = ' ',
        annotate = true,
    },
    bookmark_7 = {
        sign = ' ',
        annotate = true,
    },
    bookmark_8 = {
        sign = ' ',
        annotate = true,
    },
    bookmark_9 = {
        sign = ' ',
    },
    bookmark_0 = {
        sign = ' ',
    },
}
