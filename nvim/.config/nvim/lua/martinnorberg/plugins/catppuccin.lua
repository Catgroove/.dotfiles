return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				mason = true,
				snacks = {
					enabled = true,
				},
			},
			custom_highlights = function(colors)
				return {
					CurSearch = { bg = colors.yellow },
					GitSignsChange = { fg = colors.blue },
					CoverageCovered = { fg = colors.green },
					CoverageUncovered = { fg = colors.red },
					NormalFloat = { bg = "NONE" },
					LspHoverNormal = { bg = "NONE" },
					LspHoverBorder = { bg = "NONE" },
					RenderMarkdownCode = { bg = "NONE" },
				}
			end,
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
