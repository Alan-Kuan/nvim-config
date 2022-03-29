local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

-- auto insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

npairs.setup {
    ignored_next_char = '[a-zA-Z0-9]'
}

-- add spaces between parentheses
npairs.add_rules {
    Rule(' ', ' ')
        :with_pair(function (opts)
            local pair = opts.line:sub(opts.col - 1, opts.col)
            return vim.tbl_contains({ '()', '[]', '{}' }, pair)
        end),
    Rule('( ', ' )')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%)') ~= nil
        end)
        :use_key(')'),
    Rule('{ ', ' }')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%}') ~= nil
        end)
        :use_key('}'),
    Rule('[ ', ' ]')
        :with_pair(function() return false end)
        :with_move(function(opts)
            return opts.prev_char:match('.%]') ~= nil
        end)
        :use_key(']')
}

-- arrow function in js/ts
npairs.add_rules {
    Rule('%(.*%)%s*=>$', ' {  }', { 'javascript', 'typescript' })
        :use_regex(true)
        :set_end_pair_length(2),
}
