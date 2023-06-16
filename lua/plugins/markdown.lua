return {
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && yarn install',
    cmd = 'MarkdownPreview',
    ft = 'markdown',
    event = 'VeryLazy',
    init = function()
      vim.api.nvim_create_augroup('MD_Preview', { clear = true })
      vim.api.nvim_create_autocmd('Filetype', {
        group = 'MD_Preview',
        pattern = { 'markdown' },
        callback = function()
          vim.keymap.set('n', '<C-m>', '<Cmd>MarkdownPreview<CR>', { silent = true, buffer = true })
        end,
      })
    end,
    config = function()
      vim.g.mkdp_page_title = '${name} - Preview'
      vim.g.mkdp_echo_preview_url = 1
    end,
  },
  {
    'plasticboy/vim-markdown',
    dependencies = 'godlygeek/tabular',
    ft = 'markdown',
    event = 'VeryLazy',
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_follow_anchor = 1
      vim.g.vim_markdown_conceal = 1
      vim.g.vim_markdown_conceal_code_blocks = 1
      vim.g.vim_markdown_math = 1
      vim.g.vim_markdown_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
      vim.g.vim_markdown_new_list_item_indent = 4
      vim.g.vim_markdown_edit_url_in = 'tab'

      vim.o.conceallevel = 3
      vim.g.tex_conceal = ''

      vim.api.nvim_create_augroup('Markdown', { clear = true })
      vim.api.nvim_create_autocmd('Filetype', {
        group = 'Markdown',
        pattern = { 'markdown' },
        callback = function()
          vim.keymap.set('x', '<C-Enter>', ':<C-U>TableFormat<CR>', { silent = true })
        end,
      })
    end,
  },
  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    ft = 'markdown',
    event = 'VeryLazy',
    config = function()
      require('headlines').setup {
        markdown = {
          query = vim.treesitter.query.parse(
            'markdown',
            [[
              (atx_heading [
                (atx_h1_marker)
                (atx_h2_marker)
                (atx_h3_marker)
                (atx_h4_marker)
                (atx_h5_marker)
                (atx_h6_marker)
              ] @headline)

              (thematic_break) @dash

              (fenced_code_block) @codeblock

              (block_quote_marker) @quote
              (block_quote (paragraph (inline (block_continuation) @quote)))
            ]]
          ),
          headline_highlights = {
            'Headline1',
            'Headline2',
            'Headline3',
            'Headline4',
            'Headline5',
            'Headline6',
          },
          codeblock_highlight = 'CodeBlock',
          dash_highlight = 'Dash',
          dash_string = '-',
          quote_highlight = 'Quote',
          quote_string = '┃',
          fat_headlines = true,
          fat_headline_upper_string = '▃',
          fat_headline_lower_string = '🬂',
        },
      }

      vim.api.nvim_set_hl(0, 'Headline1', { fg = '#cb7676', bg = '#402626', italic = false })
      vim.api.nvim_set_hl(0, 'Headline2', { fg = '#c99076', bg = '#66493c', italic = false })
      vim.api.nvim_set_hl(0, 'Headline3', { fg = '#80a665', bg = '#3d4f2f', italic = false })
      vim.api.nvim_set_hl(0, 'Headline4', { fg = '#4c9a91', bg = '#224541', italic = false })
      vim.api.nvim_set_hl(0, 'Headline5', { fg = '#6893bf', bg = '#2b3d4f', italic = false })
      vim.api.nvim_set_hl(0, 'Headline6', { fg = '#d3869b', bg = '#6b454f', italic = false })
      vim.api.nvim_set_hl(0, 'CodeBlock', { bg = '#444444' })
    end,
  },
}
