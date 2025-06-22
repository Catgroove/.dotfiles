return {
	"nvim-treesitter/nvim-treesitter",
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
				"http",
				"gotmpl",
				"gomod",
				"gosum",
			},

			highlight = {
				enable = true,
				use_languagetree = true,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<M-space>",
				},
			},
		})

		vim.filetype.add({
			extension = {
				tmpl = "gotmpl",
			},
		})
	end,
}
