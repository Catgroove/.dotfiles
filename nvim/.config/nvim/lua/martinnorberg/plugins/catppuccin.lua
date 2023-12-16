return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			integrations = {
				mason = true,
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
