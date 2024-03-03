return {
	"stevearc/conform.nvim",
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
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
}
