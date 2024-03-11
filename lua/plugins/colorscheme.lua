return {
  {
    '2nthony/vitesse.nvim',
    dependencies = {
      'tjdevries/colorbuddy.nvim',
      'nvim-lua/plenary.nvim',
    },
    lazy = false,
    priority = 1000,
    opts = {
      comment_italics = true,
      transparent_background = false,
      transparent_float_background = false,
      reverse_visual = false,
      dim_nc = true,
    },
    init = function()
      -- Reference: https://mnts.dev/configure-neovim-to-follow-gnome/
      -- Create a job to detect current gnome color scheme and set background
      local function set_background()
        local job = require('plenary.job'):new({
          command = 'gsettings',
          args = { 'get', 'org.gnome.desktop.interface', 'color-scheme' }
        })
        job:sync()
        if job:result()[1] == "'default'" then
          vim.o.background = 'light'
        else
          vim.o.background = 'dark'
        end
        -- FIXME: should reload other highlighting
      end

      -- Call imidiatly to set initially
      set_background()

      -- Debounce to not call the method too often in case of multiple signals.
      local function debounce(ms, fn)
        local running = false

        return function ()
          if running then
            return
          end

          vim.defer_fn(function () running = false end, ms)
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
    end,
    config = function(_, opts)
      require('vitesse').setup(opts)

      vim.cmd.colorscheme('vitesse')

      local function update_highlight(name, hl)
        local old_hl = vim.api.nvim_get_hl(0, { name = name })
        local new_hl = vim.tbl_extend('force', old_hl, hl)
        vim.api.nvim_set_hl(0, name, new_hl)
      end

      -- Editor
      update_highlight('Normal', { bg = '#222222' })
      update_highlight('NormalNC', { bg = '#222222' })

      -- Word
      vim.api.nvim_set_hl(0, 'Visual', { bg = '#31474d' })
      vim.api.nvim_set_hl(0, 'Search', { bg = '#5f3c25' })
      vim.api.nvim_set_hl(0, 'IncSearch', { bg = '#5f3c25' })

      -- Sign Column
      vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })

      -- HTML/Markdown
      update_highlight('htmlItalic', { italic = true })
      update_highlight('htmlBoldItalic', { italic = true })
      update_highlight('htmlUnderlineItalic', { italic = true })
      update_highlight('htmlBoldUnderlineItalic', { italic = true })
    end,
  },
}
