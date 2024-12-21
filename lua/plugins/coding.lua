return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      exclude = {
        buftypes = {
          'terminal',
          'nofile',
        },
        filetypes = {
          'markdown',
          'txt',
          'help',
          'notify',
          'TelescopePrompt',
          'neo-tree',
          'Trouble',
          'lspinfo',
          'lsp-installer',
          'startuptime',
        },
      },
    },
  },
  {
    'echasnovski/mini.cursorword',
    event = 'VeryLazy',
    init = function()
      vim.api.nvim_create_augroup('MiniCursorWord', { clear = true })
      vim.api.nvim_create_autocmd('Filetype', {
        group = 'MiniCursorWord',
        pattern = {
          'markdown',
          'txt',
          'help',
          'qf', -- quickfix
          'notify',
          'TelescopePrompt',
          'neo-tree',
          'Trouble',
          'lspinfo',
          'lsp-installer',
          'dap-repl',
          'dapui_scopes',
          'dapui_breakpoints',
          'dapui_stacks',
          'dapui_watches',
          'dapui_console',
          'startuptime',
          'toggleterm',
          'dashboard',
          'alpha',
        },
        callback = function() vim.b['minicursorword_disable'] = true end,
      })
    end,
    config = function()
      require('mini.cursorword').setup {}
      vim.api.nvim_set_hl(0, 'MiniCursorWord', { bg = '#4d4531' })
    end,
  },
  {
    'echasnovski/mini.trailspace',
    event = 'VeryLazy',
    config = function()
      require('mini.trailspace').setup()
      vim.api.nvim_set_hl(0, 'Minitrailspace', { bg = '#e6a583' })
    end,
  },
  {
    'echasnovski/mini.surround',
    event = 'VeryLazy',
    keys = {
      -- NOTE: ':' moves the cursor to command line and '<C-u>' clear the command line
      {
        'S',
        ":<C-u>lua MiniSurround.add('visual')<CR>",
        mode = 'x',
        desc = 'Wrap selection with specified character',
      },
      {
        'yss',
        'ys_',
        desc = 'Wrap current line with specified character',
        remap = true,
      },
    },
    opts = {
      custom_surroundings = {
        ['('] = { output = { left = '( ', right = ' )' } },
        ['['] = { output = { left = '[ ', right = ' ]' } },
        ['{'] = { output = { left = '{ ', right = ' }' } },
        ['<'] = { output = { left = '< ', right = ' >' } },
      },
      mappings = {
        add = 'ys',
        delete = 'ds',
        find = 'gs',
        find_left = 'gS',
        highlight = '',
        replace = 'cs',
        update_n_lines = '',
      },
    },
    config = function(_, opts)
      require('mini.surround').setup(opts)
      vim.keymap.del('v', 'ys')
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')

      npairs.setup()

      -- NOTE: to work with autolist.nvim
      -- refs:
      --  - https://github.com/gaoDean/autolist.nvim/issues/77#issuecomment-1627898407
      --  - https://github.com/windwp/nvim-autopairs/issues/445#issuecomment-2033012353
      vim.keymap.set('i', '<CR>', function()
        vim.uv
          .new_timer()
          :start(0, 0, vim.schedule_wrap(function() require('autolist').new_bullet() end))
        return vim.api.nvim_feedkeys(require('nvim-autopairs').autopairs_cr(), 'in', true)
      end, { expr = true, noremap = true })

      -- ==== Custom Rules ====
      -- Ref: https://github.com/windwp/nvim-autopairs/wiki/Custom-rules

      -- Add spaces between parentheses
      local brackets = { { '(', ')' }, { '[', ']' }, { '{', '}' } }
      npairs.add_rules {
        -- Rule for a pair with left-side ' ' and right side ' '
        Rule(' ', ' ')
          -- Pair will only occur if the conditional function returns true
          :with_pair(
            function(opts)
              -- We are checking if we are inserting a space in (), [], or {}
              local pair = opts.line:sub(opts.col - 1, opts.col)
              return vim.tbl_contains({
                brackets[1][1] .. brackets[1][2],
                brackets[2][1] .. brackets[2][2],
                brackets[3][1] .. brackets[3][2],
              }, pair)
            end
          )
          :with_move(cond.none())
          :with_cr(cond.none())
          -- We only want to delete the pair of spaces when the cursor is as such: ( | )
          :with_del(
            function(opts)
              local col = vim.api.nvim_win_get_cursor(0)[2]
              local context = opts.line:sub(col - 1, col + 2)
              return vim.tbl_contains({
                brackets[1][1] .. '  ' .. brackets[1][2],
                brackets[2][1] .. '  ' .. brackets[2][2],
                brackets[3][1] .. '  ' .. brackets[3][2],
              }, context)
            end
          ),
      }
      -- For each pair of brackets we will add another rule
      for _, bracket in pairs(brackets) do
        npairs.add_rules {
          -- Each of these rules is for a pair with left-side '( ' and right-side ' )' for each bracket type
          Rule(bracket[1] .. ' ', ' ' .. bracket[2])
            :with_pair(cond.none())
            :with_move(function(opts) return opts.char == bracket[2] end)
            :with_del(cond.none())
            :use_key(bracket[2])
            -- Removes the trailing whitespace that can occur without this
            :replace_map_cr(
              function(_) return '<C-c>2xi<CR><C-c>O' end
            ),
        }
      end

      -- Auto-pair angle brackets
      npairs.add_rules {
        Rule('<', '>', {
          -- if you use nvim-ts-autotag, you may want to exclude these filetypes from this rule
          -- so that it doesn't conflict with nvim-ts-autotag
          '-html',
          '-markdown',
          '-php',
          '-javascriptreact',
          '-typescriptreact',
          '-vue',
          '-svelte',
          '-astro',
          '-xml',
        }):with_pair(
          -- regex will make it so that it will auto-pair on
          -- `a<` but not `a <`
          -- The `:?:?` part makes it also
          -- work on Rust generics like `some_func::<T>()`
          cond.before_regex('%a+:?:?$', 3)
        ):with_move(function(opts) return opts.char == '>' end),
      }
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = function()
      vim.g.skip_ts_context_commentstring_module = true

      vim.filetype.get_option = function(ft, opt)
        return opt == 'commentstring'
            and require('ts_context_commentstring.internal').calculate_commentstring()
          or vim.filetype.get_option(ft, opt)
      end

      return {
        enable_autocmd = false,
        languages = {
          cpp = {
            __default = '// %s',
          },
          c = {
            __default = '// %s',
          },
          yuck = {
            __default = '; %s',
          },
        },
      }
    end,
  },
  {
    'echasnovski/mini.splitjoin',
    event = 'VeryLazy',
    opts = {
      mappings = {
        toggle = '<Leader>s',
      },
    },
  },
  {
    'echasnovski/mini.move',
    event = 'VeryLazy',
    opts = {
      mappings = {
        left = '<S-Tab>',
        right = '<Tab>',
        line_up = '',
        line_down = '',
        line_left = '',
        line_right = '',
      },
    },
  },
}
