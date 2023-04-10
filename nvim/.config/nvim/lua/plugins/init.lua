local default_plugins = {
	{
		"christoomey/vim-tmux-navigator"
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = function()
			return require "plugins.configs.telescope"
		end,

		config = function(_, opts)
			require("telescope").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = function()
			return require "plugins.configs.treesitter"
		end,

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = function()
			return require "plugins.configs.mason"
		end,

		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim"
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = function()
			return require "plugins.configs.lualine"
		end,

		config = function(_, opts)
			require("lualine").setup(opts)
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			vim.cmd.colorscheme "catppuccin"
		end,
	},
}

require("lazy").setup(default_plugins)
