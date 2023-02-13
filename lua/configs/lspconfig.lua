-- NOTE: neodev is set up for neovim-related lua projects, and it should be setup before lspconfig
require('neodev').setup()

local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function (_, buffer)
    local set_map = function (lhs, rhs)
        vim.keymap.set('n', lhs, rhs, { buffer = buffer, silent = true })
    end

    set_map('gD',           vim.lsp.buf.declaration)
    set_map('gd',           vim.lsp.buf.definition)
    set_map('gi',           vim.lsp.buf.implementation)
    set_map('gr',           vim.lsp.buf.references)
    set_map('K',            vim.lsp.buf.hover)
    set_map('<leader>k',    vim.lsp.buf.signature_help)
    set_map('<leader>r',    vim.lsp.buf.rename)
    set_map('[d',           vim.diagnostic.goto_prev)
    set_map(']d',           vim.diagnostic.goto_next)
    set_map('<leader>f',    function () vim.lsp.buf.format { async = true } end)
    set_map('<leader>ca',   vim.lsp.buf.code_action)
end

local server_opts = {
    ['lua_ls'] = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                completion = {
                    callSnippet = 'Replace'
                }
            }
        }
    },
    ['denols'] = {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern('deno.json')
    },
    ['tsserver'] = {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = lspconfig.util.root_pattern('package.json')
    }
}

local servers = require('mason-lspconfig').get_installed_servers()
for _, server in pairs(servers) do
    local default_opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    if server_opts[server] == nil then
        lspconfig[server].setup(default_opts)
    else
        lspconfig[server].setup(server_opts[server])
    end
end

local signs = {
    Error = ' ▐',
    Warn  = ' ▐',
    Info  = ' ▐',
    Hint  = ' ▐'
}
for id, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. id
    vim.fn.sign_define(hl, { text = icon, texthl = hl, iconhl = hl })
end
