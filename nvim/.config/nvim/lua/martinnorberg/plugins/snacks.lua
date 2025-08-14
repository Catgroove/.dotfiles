return {
	"folke/snacks.nvim",
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		-- dashboard = { enabled = true },
		-- explorer = { enabled = true },
		-- indent = { enabled = true },
		-- input = { enabled = true },
		picker = { enabled = true },
		-- notifier = { enabled = true },
		-- quickfile = { enabled = true },
		-- scope = { enabled = true },
		-- scroll = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- words = { enabled = true },
		--
	},
	keys = {
		{
			"<leader>fs",
			function()
				Snacks.picker.files({ hidden = true })
			end,
			desc = "[F]ind [F]iles",
		},
		{
			"<leader>fx",
			function()
				Snacks.picker.git_files()
			end,
			desc = "[F]ind Git Files",
		},
		{
			"<leader>fo",
			function()
				Snacks.picker.recent()
			end,
			desc = "[F]ind [O]ld Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.grep({ hidden = true })
			end,
			desc = "[F]ind with [G]rep",
		},
		{
			"<leader>fw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "[F]ind current [W]ord",
		},
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "[G]oto [D]efinition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "[G]oto [R]eferences",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations()
			end,
			nowait = true,
			desc = "[G]oto [I]mplementation",
		},
	},
}
