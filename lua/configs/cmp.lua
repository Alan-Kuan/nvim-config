local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

cmp.setup {
    preselect = cmp.PreselectMode.Item,
    completion = {
        completeopt = 'menuone',
    },
    snippet = {
        expand = function (args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),

        ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { 'i' }),
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { 'i' }),

        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

        ['<C-x>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },

        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            maxwidth = 50,
            before = function (entry, vim_item)
                vim_item.menu = ({
                    nvim_lsp = '[LSP]',
                    luasnip = '[LuaSnip]',
                    path = '[Path]',
                    buffer = '[Buffer]',
                })[entry.source.name]
                return vim_item
            end
        }
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
    experimental = {
        ghost_text = true
    }
}
