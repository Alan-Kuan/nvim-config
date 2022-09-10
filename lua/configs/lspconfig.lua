local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

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
    set_map('<leader>f',    vim.lsp.buf.formatting)
    set_map('<leader>ca',   vim.lsp.buf.code_action)
end

local servers = require('nvim-lsp-installer').get_installed_servers()

local server_opts = {
    -- NOTE: lua-dev is set up for neovim-related lua projects
    ['sumneko_lua'] = require('lua-dev').setup {
        lspconfig = {
            on_attach = on_attach,
            capabilities = capabilities,
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

for _, server in pairs(servers) do
    local default_opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    if server_opts[server.name] == nil then
        lspconfig[server.name].setup(default_opts)
    else
        lspconfig[server.name].setup(server_opts[server.name])
    end
end

local signs = {
    Error = ' ▐',
    Warn  = ' ▐',
    Info  = ' ▐',
    Hint  = ' ▐'
}

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, iconhl = hl })
end
