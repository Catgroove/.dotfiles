local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.gofumpt,
	formatting.goimports_reviser,
	formatting.prettier,
	formatting.stylua,
	lint.eslint_d.with({
		condition = function(utils)
			return utils.root_has_file(".eslintrc.js")
		end,
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
