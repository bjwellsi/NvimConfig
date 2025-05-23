-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

--the plugins we wanna add
return packer.startup(function(use)
	use("wbthomason/packer.nvim") --packer itself

	use("nvim-lua/plenary.nvim") --some lua functions, required by other plugins

	use("bluz71/vim-nightfly-guicolors") --colorscheme

	use({ --file explorer
		"nvim-tree/nvim-tree.lua",
		requires = {
			"b0o/nvim-tree-preview.lua",
		},
	})

	use("kyazdani42/nvim-web-devicons")

	use("nvim-lualine/lualine.nvim")

	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) --fuzzy finder
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) --

	use("hrsh7th/nvim-cmp") --autocompletion plugin
	use("hrsh7th/cmp-buffer") --autocomplete recommends text from current buffer
	use("hrsh7th/cmp-path") --autocomplete recommends filepaths

	--snippets
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	use("williamboman/mason.nvim") --manages and installs lsp servers
	use("williamboman/mason-lspconfig.nvim") --manages connection between mason and nvim-lspconfig

	use("neovim/nvim-lspconfig") --configure lsp servers

	use("hrsh7th/cmp-nvim-lsp") --show lsps in autocompletion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		requires = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	}) -- enhanced lsp uis
	use("onsails/lspkind.nvim") --add vscode like icons to autocompletetion window

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	--auto closing
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")

	--formatting and linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	--git signs
	use("lewis6991/gitsigns.nvim")

	use({
		"tpope/vim-dadbod",
		requires = {
			use("kristijanhusak/vim-dadbod-ui"),
			use("kristijanhusak/vim-dadbod-completion"),
		},
	})

	use({
		"L3MON4D3/LuaSnip",
		requires = "rafamadriz/friendly-snippets",
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
