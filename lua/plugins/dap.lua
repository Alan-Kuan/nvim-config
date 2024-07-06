-- Ref: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/dap/core.lua
---@param config {args?:string[]|fun():string[]?}
local function get_args(config)
  local args = type(config.args) == 'function' and (config.args() or {}) or config.args or {}
  config = vim.deepcopy(config)
  ---@cast args string[]
  config.args = function()
    local new_args = vim.fn.input('Run with args: ', table.concat(args, ' ')) --[[@as string]]
    return vim.split(vim.fn.expand(new_args) --[[@as string]], ' ')
  end
  return config
end

local dap_fts = {
  'c',
  'cpp',
  'rust',
  'python',
}

return {
  {
    'mfussenegger/nvim-dap',
    ft = dap_fts,
    -- stylua: ignore
    keys = {
      { '<leader>d',  '',                                                                                   desc = '+debug',                  mode = { 'n', 'v' }, },
      { '<leader>db', function() require('dap').toggle_breakpoint() end,                                    desc = 'Toggle Breakpoint', },
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = 'Breakpoint Condition', },
      { '<leader>dc', function() require('dap').continue() end,                                             desc = 'Continue', },
      { '<leader>da', function() require('dap').continue { before = get_args } end,                         desc = 'Run with Args', },
      { '<leader>dl', function() require('dap').run_last() end,                                             desc = 'Run Last', },
      { '<leader>dC', function() require('dap').run_to_cursor() end,                                        desc = 'Run to Cursor', },
      { '<leader>dg', function() require('dap').goto_() end,                                                desc = 'Go to Line (No Execute)', },
      { '<leader>di', function() require('dap').step_into() end,                                            desc = 'Step Into', },
      { '<leader>do', function() require('dap').step_out() end,                                             desc = 'Step Out', },
      { '<leader>dn', function() require('dap').step_over() end,                                            desc = 'Step Over', },
      { '<leader>dj', function() require('dap').down() end,                                                 desc = 'Down', },
      { '<leader>dk', function() require('dap').up() end,                                                   desc = 'Up', },
      { '<leader>dp', function() require('dap').pause() end,                                                desc = 'Pause', },
      { '<leader>ds', function() require('dap').session() end,                                              desc = 'Session', },
      { '<leader>dt', function() require('dap').terminate() end,                                            desc = 'Terminate', },
      { '<leader>dw', function() require('dap.ui.widgets').hover() end,                                     desc = 'Widgets', },
      { '<leader>dx', function() require('dapui').close() end,                                              desc = 'Close DAP UIs', },
    },
    config = function()
      local dap = require('dap')

      dap.adapters.gdb = {
        type = 'executable',
        command = 'gdb',
        args = { '-i', 'dap' },
      }

      for _, lang in ipairs { 'c', 'cpp', 'rust' } do
        dap.configurations[lang] = {
          {
            name = 'Launch',
            type = 'gdb',
            request = 'launch',
            program = function()
              local path = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
              return (path and path ~= '') and path or dap.ABORT
            end,
            cwd = '${workspaceFolder}',
            stopAtBeginningOfMainSubprogram = true,
          },
        }
      end

      -- Signs
      vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = 'DapBreakpointCondition' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = 'DapBreakpointRejected' })
      vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint' })

      vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#fc6644' })
      vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { fg = '#68bef7' })
      vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { fg = '#b464f5' })
      vim.api.nvim_set_hl(0, 'DapLogPoint', { fg = '#44fc78' })
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    ft = dap_fts,
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')

      dapui.setup()

      -- Automatically open & close DAP UI
      dap.listeners.before.attach.dapui_config = dapui.open
      dap.listeners.before.launch.dapui_config = dapui.open
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = 'mfussenegger/nvim-dap',
    ft = 'python',
    config = function()
      require('dap-python').setup('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
    end,
  },
}
