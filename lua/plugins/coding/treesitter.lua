local settings = require('config.settings')

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    opts = function ()
      local parsers = require("nvim-treesitter.parsers")

      local opts = {
        ensure_installed = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
      }

      for lang, enabled in pairs(settings.langs) do
        -- if a language is enabled and its treesitter exists
        if enabled and parsers.get_parser_configs()[lang] then
          table.insert(opts.ensure_installed, lang)
        end
      end

      return opts
    end,
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    opts = {
      mode = 'topline',
    },
  },
}
