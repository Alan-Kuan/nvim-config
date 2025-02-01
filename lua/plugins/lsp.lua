return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = {
        icons = {
          package_installed = ' ',
          package_pending = ' ',
          package_uninstalled = ' ',
        },
      },
    },
  },
  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = 'williamboman/mason.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      ensure_installed = {
        -- LSPs
        'cmake-language-server',
        'unocss-language-server',
        -- Linters
        'actionlint',
        'checkmake',
        'editorconfig_checker',
        -- Formatters
        'clang-format',
        'stylua',
      },
    },
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'williamboman/mason.nvim',
      'jay-babu/mason-null-ls.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    keys = {
      {
        '<Leader>F',
        function() vim.lsp.buf.format() end,
        desc = 'Format the code',
      },
    },
    config = function()
      local nls = require('null-ls')

      nls.setup {
        sources = {
          -- Hover
          nls.builtins.hover.printenv,
        },
      }

      nls.register(nls.builtins.formatting.stylua)
    end,
  },
  { 'barreiroleo/ltex-extra.nvim' },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = 'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        -- LSPs
        'bashls',
        'clangd',
        'cssls',
        'denols',
        'dockerls',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'marksman',
        'ruff',
        'rust_analyzer',
        'svelte',
        'ts_ls',
        'volar',
        'yamlls',
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason-lspconfig.nvim',
      'saghen/blink.cmp',
    },
    config = function()
      local lspconfig = require('lspconfig')

      local on_attach = function(_, buffer)
        local set_map = function(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, {
            buffer = buffer,
            desc = desc,
            silent = true,
          })
        end

        set_map('gD', vim.lsp.buf.declaration, 'Go to declaration')
        set_map('gd', vim.lsp.buf.definition, 'Go to definition')
        set_map('gi', vim.lsp.buf.implementation, 'Go to implementation')
        set_map('gr', vim.lsp.buf.references, 'Go to references')
        set_map('<leader>k', vim.lsp.buf.signature_help, 'Show the signature')
        set_map('<leader>r', vim.lsp.buf.rename, 'Rename the symbol')
        set_map('<leader>ca', vim.lsp.buf.code_action, 'Show code actions')
      end

      local server_opts = {
        ['clangd'] = {
          cmd = { 'clangd', '--background-index', '--header-insertion=never' },
        },
        ['lua_ls'] = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        ['denols'] = {
          on_attach = function(client, buffer)
            on_attach(client, buffer)
            for _, other_client in pairs(vim.lsp.get_clients()) do
              if other_client.name == 'tsserver' then other_client.stop() end
            end
          end,
          root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
        },
        ['tsserver'] = {
          root_dir = lspconfig.util.root_pattern('package.json'),
        },
        ['volar'] = {
          init_options = {
            typescript = {
              tsdk = vim.env.HOME
                .. '/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib',
            },
          },
        },
        ['yamlls'] = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        ['ltex'] = {
          on_attach = function(client, bufnr)
            on_attach(client, bufnr)
            require('ltex_extra').setup()
          end,
        },
      }

      local servers = require('mason-lspconfig').get_installed_servers()
      for _, server in pairs(servers) do
        local server_opt = {}

        if server_opts[server] ~= nil then
          server_opt = server_opts[server]
        end
        if server_opt.on_attach == nil then
          server_opt.on_attach = on_attach
        end
        server_opt.capabilities = require('blink.cmp').get_lsp_capabilities(server_opt.capabilities)

        lspconfig[server].setup(server_opt)
      end

      vim.diagnostic.config {
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.INFO] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌵 ',
          },
        },
      }
    end,
  },
  {
    'saghen/blink.cmp',
    version = '*',
    dependencies = 'L3MON4D3/LuaSnip',
    event = 'InsertEnter',
    opts = {
      completion = {
        list = {
          selection = { preselect = false, auto_insert = true },
        },
        menu = {
          draw = {
            columns = {
              { 'label', gap = 1 },
              { 'kind_icon', 'kind', gap = 1 },
              { 'source_name' },
            },
          },
        },
      },
      keymap = {
        preset = 'super-tab',
        cmdline = { preset = 'default' },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      snippets = { preset = 'luasnip' },
    },
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    config = function()
      require('luasnip.loaders.from_lua').load {
        paths = { '~/.config/nvim/lua/snippets' },
      }
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = 'Trouble',
    keys = {
      { '<leader>x', '', desc = '+diagnostic' },
      {
        '<leader>xx',
        '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>',
        desc = 'Show diagnostics of current buffer',
      },
      {
        '<leader>xX',
        '<Cmd>Trouble diagnostics toggle<CR>',
        'Show diagnostics of current workspace',
      },
    },
    opts = {
      action_keys = { refresh = 'R' },
      auto_close = true, -- automatically close the list when you have no diagnostics
      use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
    },
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        'lazy.nvim',
        'nvim-dap-ui',
      },
    },
  },
}
