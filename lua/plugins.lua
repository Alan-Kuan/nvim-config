vim.cmd('packadd packer.nvim')

require('packer').startup(function (use)
    use 'wbthomason/packer.nvim'
    use 'alessandroyorba/despacio'
    use {
        'glepnir/dashboard-nvim',
        config = function ()
            require('configs.dashboard')
        end
    }
    use {
        'seblj/nvim-tabline',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function ()
            require('configs.tabline')
            vim.cmd('hi TabLineSeparatorActive guifg=SkyBlue')
            vim.cmd('hi TabLineModifiedSeparatorActive guifg=#ff7c7e')
            vim.cmd('hi TabLineModifiedSeparatorInactive guifg=#ff7c7e')
        end
    }
    use {
        'hoob3rt/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function ()
            require('configs.lualine')
        end
    }
    -- tabnew problem
    use {
        'kyazdani42/nvim-tree.lua',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        cmd = { 'NvimTreeToggle' },
        setup = function ()
            local map = vim.api.nvim_set_keymap
            map('n', '-', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
            vim.g.nvim_tree_auto_close = 1  -- currently, it should be here, see https://github.com/kyazdani42/nvim-tree.lua/issues/547
        end,
        config = function ()
            require('configs.nvimtree')
            vim.cmd('hi NvimTreeRootFolder guifg=white')
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function ()
            require('configs.telescope')
        end
    }
    use {
        'neovim/nvim-lspconfig',
        config = function ()
            require('configs.lspconfig')
        end
    }
    use 'kabouzeid/nvim-lspinstall'
    use {
        'hrsh7th/nvim-compe',
        config = function ()
            require('configs.compe')
        end
    }
    use 'ray-x/lsp_signature.nvim'
    use {
        'folke/trouble.nvim',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function ()
            local map = vim.api.nvim_set_keymap
            require('trouble').setup {
                action_keys = { refresh = 'R' },
                auto_close = true, -- automatically close the list when you have no diagnostics
                use_lsp_diagnostic_signs = true -- enabling this will use the signs defined in your lsp client
            }
            map('n', '<leader>xx', ':TroubleToggle<CR>', { noremap = true, silent = true })
        end
    }
    use {
        'simrat39/symbols-outline.nvim',
        config = function ()
            local map = vim.api.nvim_set_keymap
            map('n', '_', ':SymbolsOutline<CR>', { noremap = true, silent = true })
        end
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function ()
            require('configs.toggleterm')
        end
    }
    use {
        'RRethy/vim-hexokinase',
        run = 'make hexokinase',
        config = function ()
            local map = vim.api.nvim_set_keymap
            map('n', '<C-c>', ':HexokinaseToggle<CR>', { noremap = true, silent = true })
        end
    }
    use {
        'yuttie/comfortable-motion.vim',
        config = function ()
            local map = vim.api.nvim_set_keymap
            map('n', '<ScrollWheelDown>', ':call comfortable_motion#flick(40)<CR>', { noremap = true, silent = true })
            map('n', '<ScrollWheelUp>', ':call comfortable_motion#flick(-40)<CR>', { noremap = true, silent = true })
        end
    }
    use {
        'windwp/nvim-autopairs',
        config = function ()
            require('configs.autopairs');
        end
    }
    use {
        'alvan/vim-closetag',
        config = function ()
            vim.g.closetag_filenames = '*.html, *.php, *.vue, *.md'
            vim.g.closetag_filetypes = 'html, php, vue, markdown'
        end
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function ()
            require('indent_blankline').setup {
                buftype_exclude = { 'terminal', 'nofile' },
                filetype_exclude = { 'dashboard' }
            }
        end
    }
    use {
        'tomtom/tcomment_vim',
        config = function ()
            vim.g.tcomment_mapleader1 = ''
            vim.g.tcomment_mapleader2 = ''
        end
    }
    use 'tpope/vim-surround'
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn install',
        cmd = 'MarkdownPreview',
        ft = 'markdown',
        setup = function ()
            -- Start Markdown Preview
            vim.cmd([[
                augroup md_preview
                    autocmd!
                    autocmd filetype markdown nnoremap <buffer><C-m> :MarkdownPreview<CR>
                augroup END
            ]])
        end
    }
    use {
        'plasticboy/vim-markdown',
        requires = 'godlygeek/tabular',
        ft = 'markdown',
        config = function ()
            vim.g.vim_markdown_folding_disabled = 1
            vim.g.vim_markdown_new_list_item_indent = 4
            vim.g.vim_markdown_math = 1
            vim.g.vim_markdown_frontmatter = 1
        end
    }
end)
