return {
	-- Copilot
	"github/copilot.vim",

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
		branch = "harpoon2",
		opts = {
			settings = {
				save_on_toggle = true,
			},
		},
		keys = function()
			local keys = {
				{
					"<leader>ha",
					function()
						require("harpoon"):list():add()
					end,
					desc = "Add file to harpoon",
				},
				{
					"<leader>ho",
					function()
						local harpoon = require("harpoon")
						harpoon.ui:toggle_quick_menu(harpoon:list())
					end,
					desc = "Harpoon Quick Menu",
				},
			}

			for i = 1, 5 do
				table.insert(keys, {
					"<leader>" .. i,
					function()
						require("harpoon"):list():select(i)
					end,
					desc = "Navigate to harpoon file " .. i,
				})
			end

			return keys
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
	-- Better textobjects
	{
		"echasnovski/mini.ai",
		version = "*",
		opts = {},
	},
}
