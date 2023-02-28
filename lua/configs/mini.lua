-- [[ Highlight all Words Same as the Word Under Cursor ]] --
require('mini.cursorword').setup {}

vim.api.nvim_create_augroup('MiniCursorWord', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
    group = 'MiniCursorWord',
    pattern = {
        'markdown',
        'txt',
        'help',
        'qf',  -- quickfix
        'notify',
        'TelescopePrompt',
        'neo-tree',
        'Trouble',
        'lspinfo',
        'lsp-installer',
        'startuptime',
        'dashboard',
        'toggleterm'
    },
    callback = function ()
        vim.b.minicursorword_disable = true
    end,
})

-- [[ Highlight Trailing Space ]] --
require('mini.trailspace').setup {}

-- [[ Surround ]] --
require('mini.surround').setup {
    custom_surroundings = {
        ['('] = { output = { left = '( ', right = ' )' } },
        ['['] = { output = { left = '[ ', right = ' ]' } },
        ['{'] = { output = { left = '{ ', right = ' }' } },
        ['<'] = { output = { left = '< ', right = ' >' } },
    },
    mappings = {
        add = 'ys',
        delete = 'ds',
        find = 'gs',
        find_left = 'gS',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',
    },
}

-- NOTE: ':<C-u>' is the key
vim.keymap.set('x', 'S', ":<C-u>lua MiniSurround.add('visual')<CR>", { silent = true })
vim.keymap.set('n', 'yss', 'ys_', { remap = true })
vim.keymap.del('v', 'ys')

-- [[ Auto Pairs ]] --
require('mini.pairs').setup {
    mappings = {
        [' '] = { action = 'open', pair = '  ', neigh_pattern = '[%(%[{][%)%]}]' },
    },
}

-- [[ Comment ]] --
require('mini.comment').setup {
    hooks = {
        pre = function ()
            require('ts_context_commentstring.internal').update_commentstring {}
        end,
    },
}
