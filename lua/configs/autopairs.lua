local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup {
    ignored_next_char = '[a-zA-Z0-9]'
}
require('nvim-autopairs.completion.compe').setup {
    map_cr = true, --  map <CR> on insert mode
    map_complete = true, -- it will auto insert `(` after select function or method item
    auto_select = false,  -- auto select first item
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
