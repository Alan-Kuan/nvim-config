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
        'tinymist',  -- typst
        'ts_ls',
        'vue_ls',
        'yamlls',
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = 'mason-lspconfig.nvim',
    config = function()
      local on_attach = function(_, buffer)
        local set_map = function(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, {
            buffer = buffer,
            desc = desc,
            silent = true,
          })
        end

        set_map('gD', function() Snacks.picker.lsp_declarations() end, 'Go to declaration')
        set_map('gd', function() Snacks.picker.lsp_definitions() end, 'Go to definition')
        set_map('gi', function() Snacks.picker.lsp_implementations() end, 'Go to implementation')
        set_map('gr', function() Snacks.picker.lsp_references() end, 'Go to references')
        set_map('<leader>r', function() vim.lsp.buf.rename() end, 'Rename the symbol')
        set_map('<leader>ca', function() vim.lsp.buf.code_action() end, 'Show code actions')
      end

      -- overrides default options from lspconfig
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
        ['ts_ls'] = {
          workspace_required = true,
          root_markers = { 'package.json' },
        },
        ['denols'] = {
          workspace_required = true,
          root_markers = { 'deno.json', 'deno.jsonc' },
        },
        ['vue_ls'] = {
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

        vim.lsp.enable(server)
        vim.lsp.config(server, server_opt)
      end
    end,
  },
}
