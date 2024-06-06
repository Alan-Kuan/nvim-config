return {
  {
    'Shatur/neovim-ayu',
    lazy = false,
    priority = 1000,
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
    opts = {
      mirage = true,
      overrides = {
        Search = { bg = '#3d3750' },
        IncSearch = { bg = '#3d3750' },
        CurSearch = { bg = '#695380' },
      },
    },
    config = function(_, opts)
      require('ayu').setup(opts)
      require('ayu').colorscheme()
    end,
  },
}
