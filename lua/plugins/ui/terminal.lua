return {
  {
    'akinsho/toggleterm.nvim',
    keys = function()
      local keys = { '<C-`>' }

      -- Key bindings for executing the codes in current file
      local cmds = {
        ['javascript'] = 'node "%:p:."',
        ['typescript'] = 'deno run "%:p:."',
        ['python'] = 'python3 "%:p:."',
        ['c'] = 'gcc "%:p:." -o "%:p:.:r" && "./%:p:.:r"',
        ['cpp'] = 'g++ "%:p:." -o "%:p:.:r" && "./%:p:.:r"',
        ['go'] = 'go run "%:p:."',
      }
      for ft, cmd in pairs(cmds) do
        table.insert(keys, {
          '<LocalLeader>r',
          ":w <bar> :TermExec cmd='" .. cmd .. "'<CR>",
          desc = 'Save & Run the code',
          ft = ft,
        })
      end

      -- Key bindings for sending selected lines to the opened terminal
      local files = {
        'python',
        'javascript',
        'r',
      }
      for _, ft in ipairs(files) do
        table.insert(keys, {
          '<C-Enter>',
          ':<C-u>ToggleTermSendVisualLines<CR>',
          mode = 'x',
          desc = 'Send selection to the terminal',
          ft = ft,
        })
      end

      return keys
    end,
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
  },
}
