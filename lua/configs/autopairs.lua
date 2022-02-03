local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

-- auto insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

npairs.setup {
    ignored_next_char = '[a-zA-Z0-9]'
}

npairs.add_rules {
    Rule('(', ')')
        :use_key('<space>')
        :replace_endpair(function() return '  <left>' end, true)
}
npairs.add_rules {
    Rule('( ', ' )')
        :only_cr(cond.done())
}
npairs.add_rules {
    Rule('[', ']')
        :use_key('<space>')
        :replace_endpair(function() return '  <left>' end, true)
}
npairs.add_rules {
    Rule('[ ', ' ]')
        :only_cr(cond.done())
}
npairs.add_rules {
    Rule('{', '}')
        :use_key('<space>')
        :replace_endpair(function() return '  <left>' end, true)
}
npairs.add_rules {
    Rule('{ ', ' }')
        :only_cr(cond.done())
}
