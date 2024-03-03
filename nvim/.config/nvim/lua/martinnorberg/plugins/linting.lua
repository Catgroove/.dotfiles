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

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("linting-attach", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
