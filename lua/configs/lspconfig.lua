local lsp_installer = require('nvim-lsp-installer')

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
        on_attach = on_attach
    }

    local server_opts = {
        ["sumneko_lua"] = {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
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
