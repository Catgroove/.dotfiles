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
			local telescope = require "telescope"
			telescope.setup(opts)
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
