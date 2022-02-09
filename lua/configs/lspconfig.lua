local lsp_installer = require('nvim-lsp-installer')
local util = require('lspconfig').util
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
    local function buf_map(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = { noremap = true, silent = true }
    buf_map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts)
    buf_map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts)
    buf_map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>', opts)
    buf_map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts)
    buf_map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts)
    buf_map('n', '<leader>k', ':lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_map('n', '<leader>r', ':lua vim.lsp.buf.rename()<CR>', opts)
    buf_map('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_map('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_map('n', '<leader>q', ':lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_map('n', '<leader>f', ':lua vim.lsp.buf.formatting()<CR>', opts)
    buf_map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)

    require('lsp_signature').on_attach({ hint_prefix = '💡 ' })
end

lsp_installer.on_server_ready(function (server)
    local default_opts = {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    local server_opts = {
        -- notice: lua-dev is set up for neovim-related lua projects
        ["sumneko_lua"] = require('lua-dev').setup {
            lspconfig = {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        },
        ["denols"] = {
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = util.root_pattern('deno.json')
        },
        ["tsserver"] = {
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = util.root_pattern('package.json')
        }
    }

    if server_opts[server.name] == nil then
        server:setup(default_opts)
    else
        server:setup(server_opts[server.name])
    end
end)

local signs = {
    Error = ' ▐',
    Warn = ' ▐',
    Info = ' ▐',
    Hint = ' ▐'
}

for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, iconhl = hl })
end
