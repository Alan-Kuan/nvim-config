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
    astro = { enabled = true },
    awk = { enabled = true },
    bash = {
      enabled = true,
      lsp = 'bashls',
    },
    c = {
      enabled = true,
      lsp = 'clangd',
      null_ls = 'clang-format',
    },
    cmake = {
      enabled = true,
      null_ls = 'cmake-language-server',
    },
    comment = { enabled = true },
    cpp = {
      enabled = true,
      lsp = 'clangd',
      null_ls = 'clang-format',
    },
    css = {
      enabled = true,
      lsp = 'cssls',
    },
    diff = { enabled = true },
    dockerfile = {
      enabled = true,
      lsp = 'dockerls',
    },
    editorconfig = {
      enabled = true,
      null_ls = 'editorconfig_checker',
    },
    github_action = {
      enabled = true,
      null_ls = 'actionlint',
    },
    go = {
      enabled = true,
      lsp = 'gopls',
    },
    html = {
      enabled = true,
      lsp = 'html',
    },
    javascript = { enabled = true },
    json = {
      enabled = true,
      lsp = 'jsonls',
    },
    latex = { enabled = true },
    lua = {
      enabled = true,
      lsp = 'lua_ls',
      null_ls = 'stylua',
    },
    make = {
      enabled = true,
      null_ls = 'checkmake',
    },
    markdown = {
      enabled = true,
      lsp = 'marksman',
    },
    mdx = { enabled = true },
    php = { enabled = true },
    python = {
      enabled = true,
      lsp = 'ruff',
    },
    rasi = { enabled = true },
    rust = {
      enabled = true,
      lsp = 'rust_analyzer',
    },
    scss = { enabled = true },
    sql = { enabled = true },
    svelte = {
      enabled = true,
      lsp = 'svelte',
    },
    tsx = { enabled = true },
    typescript = {
      enabled = true,
      lsp = { 'denols', 'ts_ls' },
    },
    typst = {
      enabled = true,
      lsp = 'tinymist',
    },
    unocss = {
      enabled = true,
      null_ls = 'unocss-language-server',
    },
    vim = { enabled = true },
    vimdoc = { enabled = true },
    vue = {
      enabled = true,
      lsp = 'vue_ls',
    },
    yaml = {
      enabled = true,
      lsp = 'yamlls',
    },
    yuck = { enabled = true },
  },
}

-- Merge default settings with the local one (not version-controlled one)
local ok, local_settings = pcall(require, 'config.local-settings')
if ok then
  M = vim.tbl_deep_extend('force', M, local_settings)
end

return M
