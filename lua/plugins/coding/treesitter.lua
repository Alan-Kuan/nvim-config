local settings = require('config.settings')

return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    -- Ref: https://github.com/ThorstenRhau/neovim/blob/9918700a29ace6c5caab28ff9266225f88b24bd2/lua/optional/treesitter.lua
    config = function ()
      local ts = require('nvim-treesitter')

      local pending_bufs = {}

      -- a helper to start treesitter with retry for async parser installation
      local function start_with_retry(buf, lang, attempts)
        attempts = attempts or 10
        local key = buf .. ':' .. lang

        if pcall(vim.treesitter.start, buf, lang) then
          pending_bufs[key] = nil
        elseif attempts > 0 then
          vim.defer_fn(function()
            start_with_retry(buf, lang, attempts - 1)
          end, 500)
        else
          -- give up
          pending_bufs[key] = nil
        end
      end

      local function enable_highlighting(buf, lang)
        local key = buf .. ':' .. lang

        if not vim.api.nvim_buf_is_valid(buf) then
          pending_bufs[key] = nil
          return
        end

        if pending_bufs[key] then
          return
        end
        pending_bufs[key] = true

        start_with_retry(buf, lang)
      end

      local group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true })

      vim.api.nvim_create_autocmd('BufDelete', {
        group = group,
        desc = 'Cancel pending treesitter setup',
        callback = function (event)
          for key in pairs(pending_bufs) do
            if key:match('^' .. event.buf .. ':') then
              pending_bufs[key] = nil
            end
          end
        end,
      })

      vim.api.nvim_create_autocmd('FileType', {
        group = group,
        desc = 'Enable treesitter highlighting and indentation',
        callback = function (event)
          local lang = vim.treesitter.language.get_lang(event.match) or event.match

          if not settings.langs[lang] then
            return
          end

          -- install the treesitter on demand
          if settings.langs[lang].enabled and not vim.list_contains(ts.get_installed(), lang) then
            -- NOTE: this is an async function
            ts.install({ lang })
          end

          enable_highlighting(event.buf, lang)
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      })
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePost' },
    opts = {
      mode = 'topline',
    },
  },
}
