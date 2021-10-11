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

local setup_options = {
    lua = {
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { 'vim' }
                }
            }
        },
        commands = {
            Format = {
                function ()
                    require('stylua-nvim').format_file()
                end
            }
        }
    }
}

local function setup_servers()
    require('lspinstall').setup()
    local servers = require('lspinstall').installed_servers()
    for _, server in pairs(servers) do
        local option = setup_options[server] == nil and { on_attach = on_attach } or setup_options[server]
        require('lspconfig')[server].setup(option)
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require('lspinstall').post_install_hook = function ()
    setup_servers()   -- reload installed servers
    vim.cmd('bufdo e')   -- this triggers the FileType autocmd that starts the server
end

vim.fn.sign_define('LspDiagnosticsSignError', { text = ' ▐' })
vim.fn.sign_define('LspDiagnosticsSignWarning', { text = ' ▐' })
vim.fn.sign_define('LspDiagnosticsSignInformation', { text = ' ▐' })
vim.fn.sign_define('LspDiagnosticsSignHint', { text = ' ▐' })
