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
      { '<Leader>fg', function() Snacks.picker.grep() end,         desc = 'Find words' },
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
            backdrop = false,
            width = 0.8,
            height = 0.9,
            border = 'none',
            {
              box = 'vertical',
              { win = 'list', title = ' Results ', title_pos = 'center', border = 'rounded' },
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
              title = '{preview:Preview}',
              width = 0.45,
              border = 'rounded',
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
      },
    },
  },
}
