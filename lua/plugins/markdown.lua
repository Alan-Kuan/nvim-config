return {
  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    cmd = 'MarkdownPreview',
    ft = 'markdown',
    event = 'VeryLazy',
    keys = {
      { '<Leader>m', '<Cmd>MarkdownPreview<CR>', buffer = true, desc = 'Preview current Markdown file' },
    },
    config = function()
      vim.g.mkdp_page_title = '${name} - Preview'
      vim.g.mkdp_echo_preview_url = 1
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    ft = 'markdown',
    event = 'VeryLazy',
    opts = function()
      vim.api.nvim_set_hl(0, 'RMdH1', { fg = '#8ebf6b', bg = '#486335' })
      vim.api.nvim_set_hl(0, 'RMdH2', { fg = '#6abfb5', bg = '#36635e' })
      vim.api.nvim_set_hl(0, 'RMdH3', { fg = '#6893bf', bg = '#354c63' })
      vim.api.nvim_set_hl(0, 'RMdH4', { fg = '#bf8267', bg = '#634335' })
      vim.api.nvim_set_hl(0, 'RMdH5', { fg = '#bf6969', bg = '#643636' })
      vim.api.nvim_set_hl(0, 'RMdH6', { fg = '#be687d', bg = '#623540' })
      vim.api.nvim_set_hl(0, 'RMdCodeBlock', { bg = '#434343' })

      return {
        heading = {
          sign = false,
          icons = { '✱ ', '✲ ', '✤ ', '✣ ', '✸ ', '✳ ' },
          backgrounds = {
            'RMdH1',
            'RMdH2',
            'RMdH3',
            'RMdH4',
            'RMdH5',
            'RMdH6',
          },
        },
        code = {
          sign = false,
          left_pad = 1,
          highlight = 'RMdCodeBlock',
        },
        quote = {
          icon = '┃',
        },
      }
    end,
  },
  {
    'gaoDean/autolist.nvim',
    ft = {
      'markdown',
      'tex',
      'typst',
      'text',
    },
    keys = {
      { '<Tab>', '<Cmd>AutolistTab<CR>', mode = 'i' },
      { '<S-Tab>', '<Cmd>AutolistShiftTab<CR>', mode = 'i' },
      { '<CR>', '<CR><Cmd>AutolistNewBullet<CR>', mode = 'i' },
      { 'o', 'o<Cmd>AutolistNewBullet<CR>' },
      { 'O', 'O<Cmd>AutolistNewBulletBefore<CR>' },
      { '<CR>', '<Cmd>AutolistToggleCheckbox<CR>' },
      { '>>', '>><Cmd>AutolistRecalculate<CR>' },
      { '<<', '<<<Cmd>AutolistRecalculate<CR>' },
      { 'dd', 'dd<Cmd>AutolistRecalculate<CR>' },
      { 'd', 'd<Cmd>AutolistRecalculate<CR>', mode = 'v' },
    },
    opts = {
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
