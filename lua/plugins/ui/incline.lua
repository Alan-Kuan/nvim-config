return {
  {
    'b0o/incline.nvim',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    config = function()
      local helpers = require('incline.helpers')
      local devicons = require('nvim-web-devicons')

      require('incline').setup {
        window = {
          padding = 0,
          margin = { horizontal = 0 },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
          if filename == '' then filename = '[No Name]' end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          return {
            ft_icon and {
              ' ',
              ft_icon,
              ' ',
              guibg = ft_color,
              guifg = helpers.contrast_color(ft_color),
            } or '',
            ' ',
            { filename, gui = modified and 'bold,italic' or 'bold' },
            ' ',
            guibg = '#44406e',
          }
        end,
      }

      Snacks.toggle({
        name = 'Incline',
        get = function() return require('incline').is_enabled() end,
        set = function(state)
          if state then
            require('incline').enable()
          else
            require('incline').disable()
          end
        end,
      }):map('<Leader>ti')
    end,
  },
}
