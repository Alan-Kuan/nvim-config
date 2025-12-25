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
}

-- Merge default settings with the local one (not version-controlled one)
local ok, local_settings = pcall(require, 'config.local-settings')
if ok then
  M = vim.tbl_deep_extend('force', M, local_settings)
end

return M
