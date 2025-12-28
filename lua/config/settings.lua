local M = {
  colorscheme = {
    dark = 'ayu',
    light = 'rose-pine',
  },
  diagnostic_symbols = {
    ERROR = ' ',
    WARN = ' ',
    INFO = ' ',
    HINT = '󰌵 ',
  },
  langs = {
    astro = {
      enabled = false,
      null_ls = 'astro-language-server',
    },
    awk = { enabled = true },
    bash = {
      enabled = true,
      lsp = 'bashls',
    },
    c = {
      enabled = false,
      lsp = 'clangd',
      null_ls = 'clang-format',
    },
    cmake = {
      enabled = false,
      null_ls = 'cmake-language-server',
    },
    comment = { enabled = true },
    cpp = {
      enabled = false,
      lsp = 'clangd',
      null_ls = 'clang-format',
    },
    css = {
      enabled = false,
      lsp = 'cssls',
    },
    diff = { enabled = true },
    dockerfile = {
      enabled = false,
      lsp = 'dockerls',
    },
    editorconfig = {
      enabled = false,
      null_ls = 'editorconfig_checker',
    },
    github_action = {
      enabled = false,
      null_ls = 'actionlint',
    },
    go = {
      enabled = false,
      lsp = 'gopls',
    },
    html = {
      enabled = false,
      lsp = 'html',
    },
    javascript = { enabled = false },
    json = {
      enabled = true,
      lsp = 'jsonls',
    },
    latex = { enabled = false },
    lua = {
      enabled = true,
      lsp = 'lua_ls',
      null_ls = 'stylua',
    },
    make = {
      enabled = false,
      null_ls = 'checkmake',
    },
    markdown = {
      enabled = false,
      lsp = 'marksman',
    },
    mdx = { enabled = false },
    php = { enabled = false },
    python = {
      enabled = false,
      lsp = 'ruff',
    },
    rasi = { enabled = false },
    rust = {
      enabled = false,
      lsp = 'rust_analyzer',
    },
    scss = { enabled = false },
    sql = { enabled = false },
    svelte = {
      enabled = false,
      lsp = 'svelte',
    },
    tsx = { enabled = false },
    typescript = {
      enabled = false,
      lsp = { 'denols', 'ts_ls' },
    },
    typst = {
      enabled = false,
      lsp = 'tinymist',
    },
    unocss = {
      enabled = false,
      null_ls = 'unocss-language-server',
    },
    vim = { enabled = true },
    vimdoc = { enabled = true },
    vue = {
      enabled = false,
      lsp = 'vue_ls',
    },
    yaml = {
      enabled = true,
      lsp = 'yamlls',
    },
    yuck = { enabled = false },
  },
}

-- Merge default settings with the local one (not version-controlled one)
local ok, local_settings = pcall(require, 'config.local-settings')
if ok then
  M = vim.tbl_deep_extend('force', M, local_settings)
end

return M
