-- A config for my own setup
local config = {
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
}

-- Merge default config with the local one (not version-controlled one)
local local_config_path = vim.fn.stdpath('config') .. '/lua/config-local.lua'
if vim.uv.fs_stat(local_config_path) then
  local local_config = require('config-local')
  config = vim.tbl_extend('force', config, local_config)
end

_G.MyConfig = config

-- Neovim's diagnostic config
vim.diagnostic.config {
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = config.diagnostic_symbols.ERROR,
      [vim.diagnostic.severity.WARN] = config.diagnostic_symbols.WARN,
      [vim.diagnostic.severity.INFO] = config.diagnostic_symbols.INFO,
      [vim.diagnostic.severity.HINT] = config.diagnostic_symbols.HINT,
    },
  },
}
