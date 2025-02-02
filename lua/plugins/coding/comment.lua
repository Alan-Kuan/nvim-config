return {
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = 'VeryLazy',
    opts = function()
      vim.g.skip_ts_context_commentstring_module = true

      local get_option = vim.filetype.get_option
      vim.filetype.get_option = function(ft, opt)
        return opt == 'commentstring'
            and require('ts_context_commentstring.internal').calculate_commentstring()
          or get_option(ft, opt)
      end

      return {
        enable_autocmd = false,
        languages = {
          c = { __default = '// %s' },
          cpp = { __default = '// %s' },
          yuck = { __default = '; %s' },
        },
      }
    end,
  },
}
