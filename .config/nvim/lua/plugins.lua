vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use({ "wbthomason/packer.nvim", opt = true })

	-- themes
	use("~/repos/vim-envy")
	use("romainl/Apprentice")
	use("lifepillar/vim-colortemplate")
	use("jonathanfilip/vim-lucius")
	use("lifepillar/vim-solarized8")

	-- utils
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-commentary")
	-- use "tpope/vim-sleuth"
	use("tpope/vim-eunuch")
	use("tpope/vim-unimpaired")
	use("tpope/vim-rsi")
	use("cohama/lexima.vim")
	use("airblade/vim-rooter")
	use("rhysd/clever-f.vim")
	use("justinmk/vim-sneak")
	use("mattn/emmet-vim")
	use("phaazon/hop.nvim")
	use("TimUntersberger/neogit")

	-- ui
	use("ap/vim-buftabline")
	use("mbbill/undotree")
	use("junegunn/vim-peekaboo")
	use({ "lukas-reineke/indent-blankline.nvim", branch = "lua" })
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- notes
	use("plasticboy/vim-markdown")
	use("cweagans/vim-taskpaper")
	use("https://gitlab.com/dbeniamine/todo.txt-vim")
	use("junegunn/goyo.vim")
	use("godlygeek/tabular")

	-- searching
	use("justinmk/vim-dirvish")
	use("dyng/ctrlsf.vim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	})
	use("nvim-telescope/telescope-fzy-native.nvim")

	-- lsp & completion
	use("neovim/nvim-lspconfig")
	use("kabouzeid/nvim-lspinstall")
	use("nvim-lua/lsp-status.nvim")
	use("hrsh7th/nvim-compe")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	-- formatting
	use("prettier/vim-prettier")
	use("mhartington/formatter.nvim")

	-- ft
	use("habamax/vim-godot")
	use("axvr/org.vim")
	use("HerringtonDarkholme/yats.vim")
	use("evanleck/vim-svelte")
	use("pangloss/vim-javascript")
	-- use {"fatih/vim-go", run = ":GoUpdateBinaries", opt = true, ft = "go"}
end)
