-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/omar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/omar/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/omar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/omar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/omar/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.comment\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29omar.plugins.lsp.luasnip\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/omar/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/omar/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    after_files = { "/home/omar/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["eyeliner.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26omar.plugins.eyeliner\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/eyeliner.nvim",
    url = "https://github.com/jinh0/eyeliner.nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26omar.plugins.gitsigns\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.lualine\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["luv-vimdocs"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/luv-vimdocs",
    url = "https://github.com/nanotee/luv-vimdocs"
  },
  ["markdown-preview.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"omar.plugins.markdown-preview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    after = { "nvim-lspconfig" },
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    after = { "mason-lspconfig.nvim" },
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.neotree\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neorg = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23omar.plugins.neorg\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["neorg-telescope"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/neorg-telescope",
    url = "https://github.com/nvim-neorg/neorg-telescope"
  },
  ["notes-compile"] = {
    config = { "\27LJ\2\n:\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\31omar.plugins.notes-compile\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/notes-compile",
    url = "/home/omar/Code/nvim-plugins/notes-compile"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29omar.plugins.lsp.null-ls\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-FeMaco.lua"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfemaco\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/nvim-FeMaco.lua",
    url = "https://github.com/AckslD/nvim-FeMaco.lua"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.autopairs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp_luasnip", "nvim-autopairs", "cmp-cmdline", "cmp-buffer" },
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30omar.plugins.lsp.nvim-cmp\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.colorizer\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-jdtls"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.lsp.jdtls\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29omar.plugins.lsp.servers\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-luaref"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/nvim-luaref",
    url = "https://github.com/milisims/nvim-luaref"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-treesitter"] = {
    after = { "playground", "nvim-treesitter-textobjects", "nvim-treesitter-context", "nvim-FeMaco.lua", "neorg" },
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28omar.plugins.treesitter\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["obsidian.nvim"] = {
    config = { "\27LJ\2\nö\1\0\1\r\0\r\0*'\1\0\0\n\0\0\0X\2\15€\18\4\0\0009\2\1\0'\5\2\0'\6\3\0B\2\4\2\18\4\2\0009\2\1\2'\5\4\0'\6\0\0B\2\4\2\18\4\2\0009\2\5\2B\2\2\2\18\1\2\0X\2\15€)\2\1\0)\3\4\0)\4\1\0M\2\v€\18\6\1\0006\a\6\0009\a\a\a6\t\b\0009\t\t\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6O\2õ\1276\2\n\0006\4\v\0009\4\f\4B\4\1\0A\2\0\2'\3\3\0\18\4\1\0&\2\4\2L\2\2\0\ttime\aos\rtostring\vrandom\tmath\tchar\vstring\nlower\18[^A-Za-z0-9-]\6-\6 \tgsub\5Œ\1\0\0\3\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0B\0\1\2\15\0\0\0X\1\3€'\0\4\0L\0\2\0X\0\2€'\0\5\0L\0\2\0K\0\1\0\agf <cmd>ObsidianFollowLink<cr>\28cursor_on_markdown_link\tutil\robsidian\frequire€\2\1\0\6\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0003\4\15\0005\5\16\0B\0\5\1K\0\1\0\1\0\1\texpr\2\0\agf\6n\bset\vkeymap\bvim\17note_id_func\0\16daily_notes\1\0\1\vfolder\ndaily\15completion\1\0\1\rnvim_cmp\2\1\0\2\21use_advanced_uri\2\bdir\25~/Documents/obsidian\nsetup\robsidian\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/obsidian.nvim",
    url = "https://github.com/epwalsh/obsidian.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["silicon.lua"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.silicon\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/silicon.lua",
    url = "https://github.com/narutoxy/silicon.lua"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/omar/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-fzf-native.nvim" },
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.telescope\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tidy.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ttidy\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/tidy.nvim",
    url = "https://github.com/mcauley-penney/tidy.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28omar.plugins.toggleterm\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    after = { "lualine.nvim" },
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28omar.plugins.tokyonight\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.trouble\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["true-zen.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26omar.plugins.true-zen\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/true-zen.nvim",
    url = "https://github.com/Pocco81/true-zen.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/twilight.nvim",
    url = "https://github.com/folke/twilight.nvim"
  },
  vimtex = {
    config = { "\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24omar.plugins.vimtex\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  },
  vimwiki = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.vimwiki\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.which-key\frequire\0" },
    loaded = true,
    path = "/home/omar/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: tidy.nvim
time([[Config for tidy.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ttidy\frequire\0", "config", "tidy.nvim")
time([[Config for tidy.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28omar.plugins.toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30omar.plugins.lsp.nvim-cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: eyeliner.nvim
time([[Config for eyeliner.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26omar.plugins.eyeliner\frequire\0", "config", "eyeliner.nvim")
time([[Config for eyeliner.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.neotree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: obsidian.nvim
time([[Config for obsidian.nvim]], true)
try_loadstring("\27LJ\2\nö\1\0\1\r\0\r\0*'\1\0\0\n\0\0\0X\2\15€\18\4\0\0009\2\1\0'\5\2\0'\6\3\0B\2\4\2\18\4\2\0009\2\1\2'\5\4\0'\6\0\0B\2\4\2\18\4\2\0009\2\5\2B\2\2\2\18\1\2\0X\2\15€)\2\1\0)\3\4\0)\4\1\0M\2\v€\18\6\1\0006\a\6\0009\a\a\a6\t\b\0009\t\t\t)\vA\0)\fZ\0B\t\3\0A\a\0\2&\1\a\6O\2õ\1276\2\n\0006\4\v\0009\4\f\4B\4\1\0A\2\0\2'\3\3\0\18\4\1\0&\2\4\2L\2\2\0\ttime\aos\rtostring\vrandom\tmath\tchar\vstring\nlower\18[^A-Za-z0-9-]\6-\6 \tgsub\5Œ\1\0\0\3\0\6\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0B\0\1\2\15\0\0\0X\1\3€'\0\4\0L\0\2\0X\0\2€'\0\5\0L\0\2\0K\0\1\0\agf <cmd>ObsidianFollowLink<cr>\28cursor_on_markdown_link\tutil\robsidian\frequire€\2\1\0\6\0\17\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0023\3\b\0=\3\t\2B\0\2\0016\0\n\0009\0\v\0009\0\f\0'\2\r\0'\3\14\0003\4\15\0005\5\16\0B\0\5\1K\0\1\0\1\0\1\texpr\2\0\agf\6n\bset\vkeymap\bvim\17note_id_func\0\16daily_notes\1\0\1\vfolder\ndaily\15completion\1\0\1\rnvim_cmp\2\1\0\2\21use_advanced_uri\2\bdir\25~/Documents/obsidian\nsetup\robsidian\frequire\0", "config", "obsidian.nvim")
time([[Config for obsidian.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.trouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: vimtex
time([[Config for vimtex]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\24omar.plugins.vimtex\frequire\0", "config", "vimtex")
time([[Config for vimtex]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29omar.plugins.lsp.luasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26omar.plugins.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28omar.plugins.tokyonight\frequire\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.comment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: silicon.lua
time([[Config for silicon.lua]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.silicon\frequire\0", "config", "silicon.lua")
time([[Config for silicon.lua]], false)
-- Config for: true-zen.nvim
time([[Config for true-zen.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26omar.plugins.true-zen\frequire\0", "config", "true-zen.nvim")
time([[Config for true-zen.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28omar.plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nmason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29omar.plugins.lsp.null-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.vimwiki\frequire\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd mason-lspconfig.nvim ]]

-- Config for: mason-lspconfig.nvim
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20mason-lspconfig\frequire\0", "config", "mason-lspconfig.nvim")

vim.cmd [[ packadd nvim-lspconfig ]]

-- Config for: nvim-lspconfig
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29omar.plugins.lsp.servers\frequire\0", "config", "nvim-lspconfig")

vim.cmd [[ packadd lualine.nvim ]]

-- Config for: lualine.nvim
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25omar.plugins.lualine\frequire\0", "config", "lualine.nvim")

vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd playground ]]
vim.cmd [[ packadd neorg ]]

-- Config for: neorg
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23omar.plugins.neorg\frequire\0", "config", "neorg")

vim.cmd [[ packadd nvim-FeMaco.lua ]]

-- Config for: nvim-FeMaco.lua
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vfemaco\frequire\0", "config", "nvim-FeMaco.lua")

vim.cmd [[ packadd nvim-treesitter-context ]]
vim.cmd [[ packadd telescope-fzf-native.nvim ]]

-- Config for: telescope-fzf-native.nvim
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")

vim.cmd [[ packadd cmp-cmdline ]]
vim.cmd [[ packadd cmp-buffer ]]
vim.cmd [[ packadd nvim-autopairs ]]

-- Config for: nvim-autopairs
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27omar.plugins.autopairs\frequire\0", "config", "nvim-autopairs")

vim.cmd [[ packadd cmp_luasnip ]]
time([[Sequenced loading]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-jdtls'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'notes-compile', 'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vimwiki ++once lua require("packer.load")({'notes-compile', 'markdown-preview.nvim'}, { ft = "vimwiki" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
