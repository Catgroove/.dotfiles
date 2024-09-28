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

		local root_patterns_by_linter = {
			eslint_d = { ".eslintrc.json", ".eslintrc", ".eslintrc.yml", "package.json" },
		}

		local M = {}

		function M.lint()
			for linter, patterns in pairs(root_patterns_by_linter) do
				local path = patterns and vim.fs.root(0, patterns)
				if path then
					lint.linters[linter].cwd = path
				end
			end

			lint.try_lint()
		end

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = vim.api.nvim_create_augroup("linting-attach", { clear = true }),
			callback = M.lint,
		})
	end,
}
