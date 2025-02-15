return {
  {
    'snacks.nvim',
    opts = {
      dashboard = {
        config = function()
          vim.api.nvim_set_hl(0, 'SnacksDashboardHeader', { fg = '#42ff7b' })

          vim.api.nvim_set_hl(0, 'WelcomeNormal', { fg = '#ffffff' })
          vim.api.nvim_set_hl(0, 'WelcomeFindFiles', { fg = '#91cbff' })
          vim.api.nvim_set_hl(0, 'WelcomeRecentFiles', { fg = '#b3ee8f' })
          vim.api.nvim_set_hl(0, 'WelcomeFindText', { fg = '#eebf38' })
          vim.api.nvim_set_hl(0, 'WelcomeFindColor', { fg = '#c7ae84' })
          vim.api.nvim_set_hl(0, 'WelcomeMason', { fg = '#bbbbbb' })
          vim.api.nvim_set_hl(0, 'WelcomeLazy', { fg = '#5a85cc' })

          vim.api.nvim_set_hl(0, 'WelcomeShortcut', { fg = '#ffc0cb' })
        end,
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
            {
              text = {
                { '  New File', hl = 'WelcomeNormal', width = 49 },
                { 'N', hl = 'WelcomeShortcut' },
              },
              key = 'N',
              action = '<Cmd>enew <Bar> startinsert<CR>',
            },
            {
              text = {
                { '  Find Files', hl = 'WelcomeFindFiles', width = 49 },
                { 'f', hl = 'WelcomeShortcut' },
              },
              key = 'f',
              action = function() Snacks.picker.smart() end,
            },
            {
              text = {
                { '  Recent Files', hl = 'WelcomeRecentFiles', width = 49 },
                { 'r', hl = 'WelcomeShortcut' },
              },
              key = 'r',
              action = function() Snacks.picker.recent() end,
            },
            {
              text = {
                { '󰦨  Find Text', hl = 'WelcomeFindText', width = 49 },
                { 'g', hl = 'WelcomeShortcut' },
              },
              key = 'g',
              action = function() Snacks.picker.grep() end,
            },
            {
              text = {
                { '  Colorschemes', hl = 'WelcomeFindColor', width = 49 },
                { 'c', hl = 'WelcomeShortcut' },
              },
              key = 'c',
              action = function() Snacks.picker.colorschemes() end,
            },
            {
              text = {
                { '󰢛  Mason', hl = 'WelcomeMason', width = 49 },
                { 'm', hl = 'WelcomeShortcut' },
              },
              key = 'm',
              action = '<Cmd>Mason<CR>',
            },
            {
              text = {
                { '󰒲  Lazy', hl = 'WelcomeLazy', width = 49 },
                { 'l', hl = 'WelcomeShortcut' },
              },
              key = 'l',
              action = '<Cmd>Lazy<CR>',
            },
            {
              text = {
                { '  Quit', hl = 'WelcomeNormal', width = 49 },
                { 'q', hl = 'WelcomeShortcut' },
              },
              key = 'q',
              action = '<Cmd>qa<CR>',
            },
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
}
