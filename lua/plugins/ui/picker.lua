return {
  {
    'snacks.nvim',
    keys = {
      { '<Leader>f',  '',                                   desc = '+Find' },
      { '<Leader>ff', function() Snacks.picker.files() end, desc = 'Find files' },
      {
        '<Leader>fr',
        function() Snacks.picker.recent() end,
        desc = 'Find recently opened files',
      },
      { '<Leader>fg', function() Snacks.picker.grep() end,         desc = 'Find text' },
      { '<Leader>fm', function() Snacks.picker.marks() end,        desc = 'Find marks' },
      { '<Leader>fc', function() Snacks.picker.colorschemes() end, desc = 'Find colorschemes' },
      -- alternatives
      { '<C-p>',      function() Snacks.picker.smart() end,        desc = 'Find files smartly' },
      { '<C-/>',      function() Snacks.picker.grep() end,         desc = 'Find words' },
    },
    opts = {
      picker = {
        enabled = true,
        layout = {
          reverse = true,
          layout = {
            box = 'horizontal',
            backdrop = { blend = 50 },
            width = 0.8,
            height = 0.7,
            {
              box = 'vertical',
              { win = 'list', border = 'rounded' },
              {
                win = 'input',
                height = 1,
                border = 'rounded',
                title = '{title} {live} {flags}',
                title_pos = 'center',
              },
            },
            {
              win = 'preview',
              width = 0.45,
              border = 'rounded',
              title = '{preview:Preview}',
              title_pos = 'center',
            },
          },
        },
        win = {
          input = {
            keys = {
              ['<Esc>'] = { 'close', mode = { 'n', 'i' } },
            },
          },
        },
        sources = {
          select = {
            config = function(opts)
              -- ref: https://github.com/folke/snacks.nvim/discussions/2197#discussioncomment-14469268
              local max = math.floor(vim.o.lines * 0.8 - 10)

              opts.layout = {
                reverse = false,
                layout = {
                  box = 'vertical',
                  width = 0.5,
                  height = math.min(max, opts.layout.layout.height + 1 + 0.5),
                  {
                    win = 'input',
                    height = 1,
                    border = 'rounded',
                    title = '{title} {live} {flags}',
                    title_pos = 'center',
                  },
                  { win = 'list' },
                },
              }
            end,
          },
        },
      },
    },
  },
}
