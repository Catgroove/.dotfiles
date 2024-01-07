return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet engine
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- LSP completion capabilities
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},

			formatting = {
				format = function(_, item)
					local icons = {
						Array = " ",
						Boolean = " ",
						Class = " ",
						Color = " ",
						Constant = " ",
						Constructor = " ",
						Copilot = " ",
						Enum = " ",
						EnumMember = " ",
						Event = " ",
						Field = " ",
						File = " ",
						Folder = " ",
						Function = " ",
						Interface = " ",
						Key = " ",
						Keyword = " ",
						Method = " ",
						Module = " ",
						Namespace = " ",
						Null = "ﳠ ",
						Number = " ",
						Object = " ",
						Operator = " ",
						Package = " ",
						Property = " ",
						Reference = " ",
						Snippet = " ",
						String = " ",
						Struct = " ",
						Text = " ",
						TypeParameter = " ",
						Unit = " ",
						Value = " ",
						Variable = " ",
					}
					if icons[item.kind] then
						item.kind = icons[item.kind] .. item.kind
					end
					return item
				end,
			},

			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					select = true,
				}),
			}),

			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "luasnip" },
				{ name = "path" },
			},
		})
	end,
}
