require('nvim-treesitter.configs').setup {
    ensure_installed = {
        'awk',
        'bash',
        'c',
        'comment',
        'cpp',
        'css',
        'diff',
        'dockerfile',
        'go',
        'help',
        'html',
        'javascript',
        'json',
        'latex',
        'lua',
        'make',
        'markdown',
        'php',
        'python',
        'rust',
        'scss',
        'sql',
        'svelte',
        'typescript',
        'vim',
        'vue',
        'yaml'
    },
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
