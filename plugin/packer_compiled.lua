-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/alan/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/alan/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/alan/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/alan/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/alan/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["comfortable-motion.vim"] = {
    config = { "\27LJ\1\2ú\1\0\0\6\0\n\0\0164\0\0\0007\0\1\0007\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\1\5\1\16\1\0\0%\2\3\0%\3\a\0%\4\b\0003\5\t\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2,:call comfortable_motion#flick(-40)<CR>\20<ScrollWheelUp>\1\0\2\vsilent\2\fnoremap\2+:call comfortable_motion#flick(40)<CR>\22<ScrollWheelDown>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/comfortable-motion.vim",
    url = "https://github.com/yuttie/comfortable-motion.vim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.dashboard\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2˜\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\21filetype_exclude\1\2\0\0\14dashboard\20buftype_exclude\1\0\0\1\3\0\0\rterminal\vnofile\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20configs.lualine\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    config = { "\27LJ\1\2i\0\0\2\0\5\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0G\0\1\0\26mkdp_echo_preview_url\22${name} - Preview\20mkdp_page_title\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.autopairs\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18configs.compe\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-compe",
    url = "https://github.com/hrsh7th/nvim-compe"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26configs.lsp_installer\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.lspconfig\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tabline"] = {
    config = { "\27LJ\1\2ñ\1\0\0\2\0\a\0\0164\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0%\1\4\0>\0\2\0014\0\2\0007\0\3\0%\1\5\0>\0\2\0014\0\2\0007\0\3\0%\1\6\0>\0\2\1G\0\1\0006hi TabLineModifiedSeparatorInactive guifg=#ff7c7e4hi TabLineModifiedSeparatorActive guifg=#ff7c7e,hi TabLineSeparatorActive guifg=SkyBlue\bcmd\bvim\20configs.tabline\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-tabline",
    url = "https://github.com/seblj/nvim-tabline"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle" },
    config = { "\27LJ\1\2š\1\0\0\2\0\6\0\f4\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0%\1\4\0>\0\2\0014\0\2\0007\0\3\0%\1\5\0>\0\2\1G\0\1\0$hi NvimTreeNormal guibg=#272727&hi NvimTreeRootFolder guifg=white\bcmd\bvim\21configs.nvimtree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\1\2s\0\0\6\0\a\0\n4\0\0\0007\0\1\0007\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:SymbolsOutline<CR>\6_\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  tabular = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  tcomment_vim = {
    config = { "\27LJ\1\2Z\0\0\2\0\5\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\3\0:\1\4\0G\0\1\0\24tcomment_mapleader2\5\24tcomment_mapleader1\6g\bvim\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/tcomment_vim",
    url = "https://github.com/tomtom/tcomment_vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.telescope\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23configs.toggleterm\frequire\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\2ï\1\0\0\6\0\r\0\0184\0\0\0007\0\1\0007\0\2\0004\1\3\0%\2\4\0>\1\2\0027\1\5\0013\2\a\0003\3\6\0:\3\b\2>\1\2\1\16\1\0\0%\2\t\0%\3\n\0%\4\v\0003\5\f\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\23:TroubleToggle<CR>\15<leader>xx\6n\16action_keys\1\0\2\15auto_close\2\25use_diagnostic_signs\2\1\0\1\frefresh\6R\nsetup\ftrouble\frequire\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-closetag"] = {
    config = { "\27LJ\1\2‹\1\0\0\2\0\6\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0G\0\1\0\29html, php, vue, markdown\23closetag_filetypes\31*.html, *.php, *.vue, *.md\23closetag_filenames\6g\bvim\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-hexokinase"] = {
    config = { "\27LJ\1\2y\0\0\6\0\a\0\n4\0\0\0007\0\1\0007\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\26:HexokinaseToggle<CR>\n<C-c>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-hexokinase",
    url = "https://github.com/RRethy/vim-hexokinase"
  },
  ["vim-markdown"] = {
    config = { "\27LJ\1\2¼\1\0\0\2\0\6\0\0174\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\4\0:\1\3\0004\0\0\0007\0\1\0'\1\1\0:\1\4\0004\0\0\0007\0\1\0'\1\1\0:\1\5\0G\0\1\0\29vim_markdown_frontmatter\22vim_markdown_math&vim_markdown_new_list_item_indent\"vim_markdown_folding_disabled\6g\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/alan/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    url = "https://github.com/plasticboy/vim-markdown"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/alan/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2s\0\0\6\0\a\0\n4\0\0\0007\0\1\0007\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:NvimTreeToggle<CR>\6-\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\1\2ç\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Ç\1                augroup md_preview\n                    autocmd!\n                    autocmd filetype markdown nnoremap <buffer><C-m> :MarkdownPreview<CR>\n                augroup END\n            \bcmd\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: dashboard-nvim
time([[Config for dashboard-nvim]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.dashboard\frequire\0", "config", "dashboard-nvim")
time([[Config for dashboard-nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\1\2s\0\0\6\0\a\0\n4\0\0\0007\0\1\0007\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\24:SymbolsOutline<CR>\6_\6n\20nvim_set_keymap\bapi\bvim\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: vim-closetag
time([[Config for vim-closetag]], true)
try_loadstring("\27LJ\1\2‹\1\0\0\2\0\6\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0G\0\1\0\29html, php, vue, markdown\23closetag_filetypes\31*.html, *.php, *.vue, *.md\23closetag_filenames\6g\bvim\0", "config", "vim-closetag")
time([[Config for vim-closetag]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2˜\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\21filetype_exclude\1\2\0\0\14dashboard\20buftype_exclude\1\0\0\1\3\0\0\rterminal\vnofile\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18configs.compe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23configs.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: tcomment_vim
time([[Config for tcomment_vim]], true)
try_loadstring("\27LJ\1\2Z\0\0\2\0\5\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\3\0:\1\4\0G\0\1\0\24tcomment_mapleader2\5\24tcomment_mapleader1\6g\bvim\0", "config", "tcomment_vim")
time([[Config for tcomment_vim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\1\2ï\1\0\0\6\0\r\0\0184\0\0\0007\0\1\0007\0\2\0004\1\3\0%\2\4\0>\1\2\0027\1\5\0013\2\a\0003\3\6\0:\3\b\2>\1\2\1\16\1\0\0%\2\t\0%\3\n\0%\4\v\0003\5\f\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\23:TroubleToggle<CR>\15<leader>xx\6n\16action_keys\1\0\2\15auto_close\2\25use_diagnostic_signs\2\1\0\1\frefresh\6R\nsetup\ftrouble\frequire\20nvim_set_keymap\bapi\bvim\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20configs.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: comfortable-motion.vim
time([[Config for comfortable-motion.vim]], true)
try_loadstring("\27LJ\1\2ú\1\0\0\6\0\n\0\0164\0\0\0007\0\1\0007\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\1\5\1\16\1\0\0%\2\3\0%\3\a\0%\4\b\0003\5\t\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2,:call comfortable_motion#flick(-40)<CR>\20<ScrollWheelUp>\1\0\2\vsilent\2\fnoremap\2+:call comfortable_motion#flick(40)<CR>\22<ScrollWheelDown>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "comfortable-motion.vim")
time([[Config for comfortable-motion.vim]], false)
-- Config for: nvim-lsp-installer
time([[Config for nvim-lsp-installer]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\26configs.lsp_installer\frequire\0", "config", "nvim-lsp-installer")
time([[Config for nvim-lsp-installer]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-tabline
time([[Config for nvim-tabline]], true)
try_loadstring("\27LJ\1\2ñ\1\0\0\2\0\a\0\0164\0\0\0%\1\1\0>\0\2\0014\0\2\0007\0\3\0%\1\4\0>\0\2\0014\0\2\0007\0\3\0%\1\5\0>\0\2\0014\0\2\0007\0\3\0%\1\6\0>\0\2\1G\0\1\0006hi TabLineModifiedSeparatorInactive guifg=#ff7c7e4hi TabLineModifiedSeparatorActive guifg=#ff7c7e,hi TabLineSeparatorActive guifg=SkyBlue\bcmd\bvim\20configs.tabline\frequire\0", "config", "nvim-tabline")
time([[Config for nvim-tabline]], false)
-- Config for: vim-hexokinase
time([[Config for vim-hexokinase]], true)
try_loadstring("\27LJ\1\2y\0\0\6\0\a\0\n4\0\0\0007\0\1\0007\0\2\0\16\1\0\0%\2\3\0%\3\4\0%\4\5\0003\5\6\0>\1\5\1G\0\1\0\1\0\2\vsilent\2\fnoremap\2\26:HexokinaseToggle<CR>\n<C-c>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "vim-hexokinase")
time([[Config for vim-hexokinase]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/alan/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/alan/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/alan/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
