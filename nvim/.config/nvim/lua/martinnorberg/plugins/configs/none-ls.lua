local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.mix,
	formatting.gofumpt,
	formatting.goimports_reviser.with({
		extra_args = {
			"-rm-unused",
			"-use-cache",
			"-company-prefixes",
			"github.com/shipwallet",
			"-imports-order",
			"std,general,company,project",
		},
	}),
	-- gci,
	lint.golangci_lint.with({
		extra_args = { "--disable", "staticcheck", "--enable", "gosec" },
	}),
	formatting.prettierd.with({
		condition = function(utils)
			return utils.has_file({ ".prettierrc.js" })
				or utils.has_file({ "prettier.config.cjs" })
				or utils.has_file({ "prettier.config.mjs" })
		end,
	}),
	formatting.stylua,
	lint.eslint_d,
	formatting.sqlfluff.with({
		extra_args = { "--dialect", "postgres" },
	}),
	lint.sqlfluff.with({
		extra_args = { "--dialect", "postgres" },
	}),
}

local on_attach = function(current_client, bufnr)
	if current_client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,

			callback = function()
				vim.lsp.buf.format({
					filter = function(client)
						--  only use null-ls for formatting instead of lsp server
						return client.name == "null-ls"
					end,
					bufnr = bufnr,
				})
			end,
		})
	end
end

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = on_attach,
})
