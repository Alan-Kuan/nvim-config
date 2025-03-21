local config = {
  colorscheme = {
    dark = 'ayu',
    light = 'rose-pine',
  },
}

-- Merge default config with the local one
local local_config_path = vim.fn.stdpath('config') .. '/lua/config-local.lua'
if vim.uv.fs_stat(local_config_path) then
  local local_config = require('config-local')
  config = vim.tbl_extend('force', config, local_config)
end

_G.NvimConfig = config

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = '󰌵 ',
    },
  },
}
