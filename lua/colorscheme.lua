-- Ref: https://mnts.dev/configure-neovim-to-follow-gnome/

local LIGHT_THEME = 'everforest'
local DARK_THEME = 'ayu'

-- Create a job to detect current gnome color scheme and set background
local function set_background()
  local job = require('plenary.job'):new {
    command = 'gsettings',
    args = { 'get', 'org.gnome.desktop.interface', 'color-scheme' },
  }
  job:sync()
  if job:result()[1] == "'default'" then
    vim.o.background = 'light'
    vim.cmd.colorscheme(LIGHT_THEME)
  else
    vim.o.background = 'dark'
    vim.cmd.colorscheme(DARK_THEME)
  end
  -- FIXME: should reload other highlighting
end

-- Call immediatly to set initially
set_background()

-- Debounce to not call the method too often in case of multiple signals.
local function debounce(ms, fn)
  local running = false

  return function()
    if running then return end

    vim.defer_fn(function() running = false end, ms)
    running = true
    vim.schedule(fn)
  end
end

-- Listen for SIGUSR1 signal to update colorscheme
local group = vim.api.nvim_create_augroup('BackgroundWatch', { clear = true })
vim.api.nvim_create_autocmd('Signal', {
  pattern = 'SIGUSR1',
  callback = debounce(500, set_background),
  group = group,
})
