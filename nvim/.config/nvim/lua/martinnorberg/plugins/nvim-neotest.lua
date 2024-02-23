return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-go",
		},
		config = function()
			local neotest = require("neotest")
			neotest.setup({
				adapters = {},
			})

			vim.keymap.set("n", "<leader>tc", function()
				neotest.run.run()
			end)

			vim.keymap.set("n", "<leader>tf", function()
				neotest.run.run(vim.fn.expand("%"))
			end)
		end,
	},
}
