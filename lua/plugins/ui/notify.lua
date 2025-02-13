return {
  {
    'snacks.nvim',
    keys = {
      {
        '<Leader>n',
        function() Snacks.notifier.show_history() end,
        desc = 'Show notification history',
      },
    },
    ---@type snacks.Config
    opts = {
      notifier = {
        enabled = true,
        ---@type snacks.notifier.style
        style = 'fancy',
        top_down = false,
        filter = function(n)
          if n.msg == 'No information available' then return false end
          return true
        end,
      },
    },
  },
}
