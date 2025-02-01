return {
  {
    'goolord/alpha-nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = 'VimEnter',
    opts = function()
      local dashboard = require('alpha.themes.dashboard')

      -- Content
      dashboard.section.header.val = {
        [[   _  _                              _            ]],
        [[  | \| |    ___     ___    __ __    (_)    _ __   ]],
        [[  | .` |   / -_)   / _ \   \ V /    | |   | '  \  ]],
        [[  |_|\_|   \___|   \___/   _\_/_   _|_|_  |_|_|_| ]],
        [[ _|"""""|_|"""""|_|"""""|_|"""""|_|"""""|_|"""""| ]],
        [[ "`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-'"`-0-0-' ]],
      }
      -- stylua: ignore
      dashboard.section.buttons.val = {
        dashboard.button('N', '  New File',      '<Cmd>enew <Bar> startinsert<CR>'),
        dashboard.button('f', '  Find File',     '<Cmd>Telescope find_files<CR>'),
        dashboard.button('r', '  Recent Files',  '<Cmd>Telescope oldfiles<CR>'),
        dashboard.button('g', '󰦨  Find Text',     '<Cmd>Telescope live_grep<CR>'),
        dashboard.button('b', '  Bookmarks',     '<Cmd>Telescope marks<CR>'),
        dashboard.button('c', '  Colorschemes',  '<Cmd>Telescope colorscheme<CR>'),
        dashboard.button('m', '󰢛  Mason',         '<Cmd>Mason<CR>'),
        dashboard.button('l', '󰒲  Lazy',          '<Cmd>Lazy<CR>'),
        dashboard.button('q', '  Quit',          '<Cmd>qa<CR>'),
      }
      dashboard.section.footer.val = {
        '',
        '',
        ' Enjoy your day.',
      }

      -- Highlightings
      dashboard.section.header.opts.hl = 'AlphaHeader'

      local icon_highlights = {
        'AlphaIcon',
        'AlphaMagnifierIcon',
        'AlphaClockIcon',
        'AlphaWordIcon',
        'AlphaBookmarkIcon',
        'AlphaPaletteIcon',
        'AlphaAnvilIcon',
        'AlphaSleepIcon',
        'AlphaIcon',
      }
      for idx, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = icon_highlights[idx]
        button.opts.hl_shortcut = 'AlphaShortcut'
      end

      dashboard.section.footer.opts.hl = 'AlphaFooter'

      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == 'lazy' then
        vim.cmd.close()
        vim.api.nvim_create_autocmd('User', {
          once = true,
          pattern = 'AlphaReady',
          callback = function() require('lazy').show() end,
        })
      end

      require('alpha').setup(dashboard.opts)

      -- stylua: ignore start
      -- Main Colors
      vim.api.nvim_set_hl(0, 'AlphaHeader',   { fg = '#42ff7b' })
      vim.api.nvim_set_hl(0, 'AlphaNormal',   { fg = '#fff0cd' })
      vim.api.nvim_set_hl(0, 'AlphaShortcut', { fg = '#ffc0cb' })
      vim.api.nvim_set_hl(0, 'AlphaFooter',   { fg = '#ffd062' })

      -- Icon Colors
      vim.api.nvim_set_hl(0, 'AlphaIcon',           { fg = '#ffffff' })
      vim.api.nvim_set_hl(0, 'AlphaMagnifierIcon',  { fg = '#91cbff' })
      vim.api.nvim_set_hl(0, 'AlphaClockIcon',      { fg = '#b3ee8f' })
      vim.api.nvim_set_hl(0, 'AlphaWordIcon',       { fg = '#eebf38' })
      vim.api.nvim_set_hl(0, 'AlphaBookmarkIcon',   { fg = '#f27438' })
      vim.api.nvim_set_hl(0, 'AlphaPaletteIcon',    { fg = '#c7ae84' })
      vim.api.nvim_set_hl(0, 'AlphaAnvilIcon',      { fg = '#bbbbbb' })
      vim.api.nvim_set_hl(0, 'AlphaSleepIcon',      { fg = '#5a85cc' })
      -- stylua: ignore end

      -- Reopen Alpha when last buffer is closed
      vim.api.nvim_create_augroup('AlphaReopen', { clear = true })
      vim.api.nvim_create_autocmd('User', {
        pattern = 'BDeletePost *', -- event of bufdelete.nvim
        group = 'AlphaReopen',
        callback = function(event)
          local fallback_name = vim.api.nvim_buf_get_name(event.buf)
          local fallback_ft = vim.api.nvim_get_option_value('filetype', { buf = event.buf })

          if fallback_name == '' and fallback_ft == '' then
            vim.cmd('Alpha | bd#')
            ---@diagnostic disable-next-line: undefined-global
            MiniTrailspace.unhighlight() -- global table set up by mini.trailspace
          end
        end,
      })
    end,
  },
}
