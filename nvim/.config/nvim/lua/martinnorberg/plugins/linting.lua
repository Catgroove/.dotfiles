return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			-- go
			go = { "golangcilint" },

			-- js/ts
			typescript = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			javascript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
		}

		local M = {}

		function M.lint()
			local get_clients = vim.lsp.get_clients or vim.lsp.buf_active_clients
			local client = get_clients({ bufnr = 0 })[1] or {}
			lint.try_lint(nil, { cwd = client.root_dir })
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("linting-attach", { clear = true }),
			callback = M.lint,
		})
	end,
}
