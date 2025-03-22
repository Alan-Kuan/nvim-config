return {
  {
    'snacks.nvim',
    opts = {
      dashboard = {
        enabled = true,
        preset = {
          header = [[
  _  _                              _           
 | \| |    ___     ___    __ __    (_)    _ __  
 | .` |   / -_)   / _ \   \ V /    | |   | '  \ 
 |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_|
_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""|
"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-']],
          keys = {
            { icon = ' ', key = 'N', desc = 'New File', align = 'left', action = '<Cmd>enew <Bar> startinsert<CR>' },
            { icon = ' ', key = 'f', desc = 'Find Files', align = 'left', action = function() Snacks.picker.smart() end },
            { icon = ' ', key = 'r', desc = 'Recent Files', align = 'left', action = function() Snacks.picker.recent() end },
            { icon = '󰦨 ', key = 'g', desc = 'Find Text', align = 'left', action = function() Snacks.picker.grep() end },
            { icon = ' ', key = 'c', desc = 'Colorschemes', align = 'left', action = function() Snacks.picker.colorschemes() end },
            { icon = '󰢛 ', key = 'm', desc = 'Mason', align = 'left', action = '<Cmd>Mason<CR>' },
            { icon = '󰒲 ', key = 'l', desc = 'Lazy', align = 'left', action = '<Cmd>Lazy<CR>' },
            { icon = ' ', key = 'q', desc = 'Quit', align = 'left', action = '<Cmd>qa<CR>' },
          },
        },
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 2, align = 'center' },
          { section = 'startup', padding = 1 },
          { footer = '☕️ Enjoy your day.' },
        },
      },
    },
  },
  {
    'ayu',
    opts = {
      overrides = {
        SnacksDashboardHeader = { fg = '#d5ff80' },
        SnacksDashboardIcon = { fg = '#ffad66' },
        SnacksDashboardDesc = { fg = '#ffdfb3' },
        SnacksDashboardKey = { fg = '#f28779' },
      },
    },
  },
  {
    'rose-pine',
    opts = {
      highlight_groups = {
        SnacksDashboardHeader = { fg = 'pine' },
        SnacksDashboardIcon = { fg = 'foam' },
        SnacksDashboardDesc = { fg = '#555555' },
        SnacksDashboardKey = { fg = 'love' },
      },
    },
  },
}
