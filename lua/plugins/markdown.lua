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
      { '<C-m>', '<Cmd>MarkdownPreview<CR>', buffer = true, desc = 'Preview current Markdown file' },
    },
    config = function()
      vim.g.mkdp_page_title = '${name} - Preview'
      vim.g.mkdp_echo_preview_url = 1
    end,
  },
  {
    'MeanderingProgrammer/markdown.nvim',
    enabled = true,
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    ft = 'markdown',
    event = 'VeryLazy',
    opts = function()
      vim.api.nvim_set_hl(0, 'MarkdownH1', { fg = '#8ebf6b', bg = '#486335' })
      vim.api.nvim_set_hl(0, 'MarkdownH2', { fg = '#6abfb5', bg = '#36635e' })
      vim.api.nvim_set_hl(0, 'MarkdownH3', { fg = '#6893bf', bg = '#354c63' })
      vim.api.nvim_set_hl(0, 'MarkdownH4', { fg = '#bf8267', bg = '#634335' })
      vim.api.nvim_set_hl(0, 'MarkdownH5', { fg = '#bf6969', bg = '#643636' })
      vim.api.nvim_set_hl(0, 'MarkdownH6', { fg = '#be687d', bg = '#623540' })
      vim.api.nvim_set_hl(0, 'CodeBlock', { bg = '#434343' })

      return {
        headings = { '✱ ', '✲ ', '✤ ', '✣ ', '✸ ', '✳ ' },
        quote = '┃',
        highlights = {
          heading = {
            backgrounds = {
              'MarkdownH1',
              'MarkdownH2',
              'MarkdownH3',
              'MarkdownH4',
              'MarkdownH5',
              'MarkdownH6',
            },
          },
          code = 'CodeBlock',
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
