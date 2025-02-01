return {
  {
    'akinsho/toggleterm.nvim',
    opts = {
      size = function(term)
        if term.direction == 'horizontal' then
          return 10
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = '<C-`>',
      direction = 'float',
      float_opts = {
        border = 'curved',
      },
    },
    config = function(_, opts)
      require('toggleterm').setup(opts)

      -- Key bindings for executing the codes in current file

      local set_keymap = function(ft, cmd)
        vim.api.nvim_create_autocmd('Filetype', {
          group = 'Toggleterm',
          pattern = { ft },
          callback = function()
            vim.keymap.set(
              'n',
              '<F5>',
              ":w <bar> :TermExec cmd='" .. cmd .. "'<CR>",
              { desc = 'Run the code' }
            )
          end,
        })
      end

      local cmds = {
        ['javascript'] = 'node "%:p:."',
        ['typescript'] = 'deno run "%:p:."',
        ['python'] = 'python3 "%:p:."',
        ['c'] = 'gcc "%:p:." -o "%:p:.:r" && "./%:p:.:r"',
        ['cpp'] = 'g++ "%:p:." -o "%:p:.:r" && "./%:p:.:r"',
        ['go'] = 'go run "%:p:."',
      }

      vim.api.nvim_create_augroup('Toggleterm', { clear = true })

      for ft, cmd in pairs(cmds) do
        set_keymap(ft, cmd)
      end

      -- Key bindings for sending selected lines to the opened terminal

      local files = {
        'python',
        'javascript',
        'r',
      }

      for _, ft in ipairs(files) do
        vim.api.nvim_create_autocmd('Filetype', {
          group = 'Toggleterm',
          pattern = { ft },
          callback = function()
            vim.keymap.set(
              'x',
              '<C-Enter>',
              ':<C-u>ToggleTermSendVisualLines<CR>',
              { silent = true, desc = 'Send selection to the terminal' }
            )
          end,
        })
      end
    end,
  },
}
