local map = vim.api.nvim_set_keymap
vim.opt.completeopt = 'menuone,noselect'

require('compe').setup {
    documentation = {
        border = { '', '' ,'', ' ', '', '', '', '▌' },
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1
    },
    source = {
        path = true,
        buffer = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        vsnip = false,
        ultisnips = false,
        luasnip = false,
        emoji = true
    }
}

local t = function (str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function ()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
-- move to prev/next item in completion menuone
-- jump to prev/next snippet's placeholder
_G.tab_complete = function ()
    if vim.fn.pumvisible() == 1 then
        return t('<C-n>')
    --elseif vim.fn['vsnip#available'](1) == 1 then
    --    return t '<Plug>(vsnip-expand-or-jump)'
    elseif check_back_space() then
        return t('<Tab>')
    else
        return vim.fn['compe#complete']()
    end
end
_G.s_tab_complete = function ()
    if vim.fn.pumvisible() == 1 then
        return t('<C-p>')
    --elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    --    return t '<Plug>(vsnip-jump-prev)'
    else
        -- If <S-Tab> is not working in your terminal, change it to <C-h>
        return t('<S-Tab>')
    end
end

local expr = { expr = true }
map('i', '<Tab>',       'v:lua.tab_complete()', expr)
map('i', '<S-Tab>',     'v:lua.s_tab_complete()', expr)

local option = { noremap = true, silent = true, expr = true }
map('i', '<C-Space>',   'compe#complete()', option)
map('i', '<CR>',        'compe#confirm(luaeval("require(\'nvim-autopairs\').autopairs_cr()"))', option)
map('i', '<C-e>',       "compe#close('<C-e>')", option)
map('i', '<C-f>',       "compe#scroll({ 'delta': +4 })", option)
map('i', '<C-d>',       "compe#scroll({ 'delta': -4 })", option)
