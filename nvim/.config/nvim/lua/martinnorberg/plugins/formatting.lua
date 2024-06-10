return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = function(bufnr)
			if vim.b[bufnr].format_on_save then
				return {
					timeout_ms = 500,
					lsp_fallback = true,
				}
			end
		end,

		formatters_by_ft = {
			-- lua
			lua = { "stylua" },

			-- go
			go = { "gofumpt", "goimports", "goimportstidy" },

			-- js/ts
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			html = { "prettierd" },
			css = { "prettierd" },
		},
		formatters = {
			goimportstidy = {
				command = "goimportstidy",
				args = { "-w", "-local", "github.com/shipwallet", "$FILENAME" },
				stdin = false,
			},
		},
	},
	init = function()
		vim.api.nvim_create_autocmd("BufEnter", {
			callback = function(args)
				vim.b[args.buf].format_on_save = true
			end,
		})

		vim.api.nvim_create_user_command("ToggleFormat", function()
			local bufnr = vim.api.nvim_get_current_buf()
			vim.b[bufnr].format_on_save = not vim.b[bufnr].format_on_save

			vim.notify("Changed autoformatting to " .. tostring(vim.b[bufnr].format_on_save), vim.log.levels.INFO)
		end, {})
	end,
}
