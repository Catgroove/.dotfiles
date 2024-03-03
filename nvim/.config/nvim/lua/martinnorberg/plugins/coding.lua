return {
	-- Comments
	{
		"echasnovski/mini.comment",
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},
	-- JSX-aware comments
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		opts = {
			enable_autocmd = false,
		},
	},
	-- Harpoon
	{
		"ThePrimeagen/harpoon",
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>ha", mark.add_file)
			vim.keymap.set("n", "<leader>ho", ui.toggle_quick_menu)

            --stylua: ignore start
            vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
            vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
            vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
            vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
            vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end)
			--stylua: ignore end

			require("harpoon").setup({})
		end,
	},
	-- Auto tagging for HTML/JSX
	{
		"windwp/nvim-ts-autotag",
		opts = {
			enable_close_on_slash = false,
		},
	},
	-- Surround
	{
		"echasnovski/mini.surround",
		opts = {},
	},
	-- Go specific helper commands
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},
}
