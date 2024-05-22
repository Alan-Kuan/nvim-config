return {
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = {
        icons = {
          package_installed = ' ',
          package_pending = ' ',
          package_uninstalled = '󰅙 ',
        },
      },
    },
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = 'mason.nvim',
    opts = {
      ensure_installed = {
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
        'pyright',
        'rust_analyzer',
        'svelte',
        'tsserver',
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
      'folke/neodev.nvim',
      'hrsh7th/nvim-cmp',
    },
    opts = {
      diagnostic_signs = {
        Error = '┃',
        Warn = '┃',
        Info = '┃',
        Hint = '┃',
      },
    },
    config = function(_, opts)
      -- NOTE: neodev is set up for neovim-related lua projects, and it should be setup before lspconfig
      require('neodev').setup()

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
          on_attach = on_attach,
          capabilities = capabilities,
          cmd = {
            'clangd',
            '--background-index',
            '--header-insertion=never',
          },
        },
        ['lua_ls'] = {
          on_attach = on_attach,
          capabilities = capabilities,
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
          on_attach = function (_, buffer)
            on_attach(_, buffer)
            for _, client in pairs(vim.lsp.get_clients()) do
              if client.name == 'tsserver' then
                client.stop()
              end
            end
          end,
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern('deno.json', 'deno.jsonc'),
        },
        ['tsserver'] = {
          on_attach = on_attach,
          capabilities = capabilities,
          root_dir = lspconfig.util.root_pattern('package.json'),
        },
        ['volar'] = {
          on_attach = on_attach,
          capabilities = capabilities,
          init_options = {
            typescript = {
              tsdk = vim.env.HOME .. '/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib',
            },
          },
        },
        ['yamlls'] = {
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
      }

      local servers = require('mason-lspconfig').get_installed_servers()
      for _, server in pairs(servers) do
        local default_opts = {
          on_attach = on_attach,
          capabilities = capabilities,
        }

        if server_opts[server] == nil then
          lspconfig[server].setup(default_opts)
        else
          lspconfig[server].setup(server_opts[server])
        end
      end

      for id, icon in pairs(opts.diagnostic_signs) do
        local hl = 'DiagnosticSign' .. id
        vim.fn.sign_define(hl, { text = icon, texthl = hl, iconhl = hl })
      end
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mason.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local null_ls = require('null-ls')

      return {
        sources = {
          null_ls.builtins.diagnostics.actionlint,
        },
      }
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    cmd = { 'TroubleToggle', 'Trouble' },
    keys = {
      { '<leader>xx', '<Cmd>TroubleToggle document_diagnostics<CR>' },
      { '<leader>xX', '<Cmd>TroubleToggle workspace_diagnostics<CR>' },
    },
    opts = {
      action_keys = { refresh = 'R' },
      auto_close = true, -- automatically close the list when you have no diagnostics
      use_diagnostic_signs = true, -- enabling this will use the signs defined in your lsp client
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      {
        'saadparwaiz1/cmp_luasnip',
        dependencies = 'L3MON4D3/LuaSnip',
      },
      'onsails/lspkind-nvim',
    },
    event = 'InsertEnter',
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')
      local lspkind = require('lspkind')

      cmp.setup {
        preselect = cmp.PreselectMode.Item,
        completion = {
          completeopt = 'menuone',
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = {
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { 'i' }),
          ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { 'i' }),

          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

          ['<C-x>'] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },

          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
              vim_item.menu = ({
                nvim_lsp = '[LSP]',
                luasnip = '[LuaSnip]',
                path = '[Path]',
                buffer = '[Buffer]',
              })[entry.source.name]
              return vim_item
            end,
          },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer' },
        },
        experimental = {
          ghost_text = true,
        },
      }
    end,
  },
  {
    'L3MON4D3/LuaSnip',
    version = 'v2.*',
    config = function ()
      require('luasnip.loaders.from_lua').load({
        paths = { '~/.config/nvim/lua/snippets' }
      })
    end
  },
}
