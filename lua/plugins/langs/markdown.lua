local settings = require('config.settings')

return {
  {
    'toppair/peek.nvim',
    enabled = settings.langs.markdown.enabled,
    build = 'deno task --quiet build:fast',
    ft = 'markdown',
    keys = {
      {
        '<LocalLeader>m',
        function()
          local peek = require('peek')
          if peek.is_open() then
            peek.close()
          else
            peek.open()
          end
        end,
        buffer = true,
        desc = 'Toggle Markdown preview',
        ft = 'markdown',
      },
    },
    opts = {},
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = settings.langs.markdown.enabled,
    ft = { 'markdown', 'mdx' },
    opts = {
      completions = {
        blink = { enabled = true },
      },
      code = {
        width = 'block',
        min_width = 45,
        left_pad = 1,
        right_pad = 1,
      },
      heading = {
        width = 'block',
        min_width = 60,
        position = 'inline',
        left_pad = 1,
        icons = ' ',
      },
      indent = {
        enabled = true,
        skip_heading = true,
      },
      pipe_table = {
        preset = 'round',
        alignment_indicator = '',
      },
      quote = { icon = '┃' },
      sign = { enabled = false },
      overrides = {
        buftype = {
          nofile = {
            code = { left_pad = 0, right_pad = 0 },
          },
        },
      },
    },
  },
  {
    -- temporarily switched to mcauley-penney's version with a fix
    -- to the issue https://github.com/gaoDean/autolist.nvim/issues/79
    'mcauley-penney/autolist.nvim',
    -- disable it due to an unsolved issue, https://github.com/gaoDean/autolist.nvim/issues/85
    enabled = false,
    ft = {
      'markdown',
      'tex',
      'typst',
      'text',
    },
    keys = {
      { '<Tab>', '<Cmd>AutolistTab<CR>', mode = 'i' },
      { '<S-Tab>', '<Cmd>AutolistShiftTab<CR>', mode = 'i' },
      { 'o', 'o<Cmd>AutolistNewBullet<CR>' },
      { 'O', 'O<Cmd>AutolistNewBulletBefore<CR>' },
      { '<CR>', '<Cmd>AutolistToggleCheckbox<CR>' },
      { '>>', '>><Cmd>AutolistRecalculate<CR>' },
      { '<<', '<<<Cmd>AutolistRecalculate<CR>' },
      { 'dd', 'dd<Cmd>AutolistRecalculate<CR>' },
      { 'd', 'd<Cmd>AutolistRecalculate<CR>', mode = 'v' },
    },
    opts = {
      colon = {
        indent = false,
        indent_raw = false,
      },
      lists = {
        typst = {
          '[-+*]', -- unordered
          '%d+[.)]', -- digit
          '%a[.)]', -- ascii
          '%u*[.)]', -- roman
        },
      },
    },
  },
}
