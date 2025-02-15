return {
  -- used by mason-null-ls.nvim
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
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
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
  -- used by mason-null-ls.nvim
  {
    'nvimtools/none-ls.nvim',
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
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = 'mason.nvim',
    lazy = true,
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
    dependencies = 'mason-lspconfig.nvim',
    event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
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
              format = {
                enable = false,
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
}
