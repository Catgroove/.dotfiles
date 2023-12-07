return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"elixir",
				"graphql",
				"go",
				"elixir",
				"bash",
				"dockerfile",
				"gitignore",
				"proto",
				"sql",
			},

			highlight = {
				enable = true,
				use_languagetree = true,
			},

			indent = { enable = true },
		})
	end,
}
