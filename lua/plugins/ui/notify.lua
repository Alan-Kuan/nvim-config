return {
  {
    'rcarriga/nvim-notify',
    opts = {
      top_down = false,
    },
    config = function(_, opts)
      require('notify').setup(opts)

      local banned_msgs = {
        'No information available',
      }
      vim.notify = function(msg, ...)
        for _, banned in ipairs(banned_msgs) do
          if msg == banned then return end
        end
        return require('notify')(msg, ...)
      end
    end,
  },
}
