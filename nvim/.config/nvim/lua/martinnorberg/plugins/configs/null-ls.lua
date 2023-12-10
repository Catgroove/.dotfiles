local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local methods = require("null-ls.methods")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local FORMATTING = methods.internal.FORMATTING

local goimportstidy = h.make_builtin({
	name = "goimportstidy",
	meta = {
		url = "https://github.com/krzysztofdrys/goimportstidy",
		description = "This tool updates your Go import lines, grouping it into three groups",
	},
	method = FORMATTING,
	filetypes = { "go" },
	generator_opts = {
		command = "goimportstidy",
		args = { "-w", "-local", "github.com/shipwallet", "$FILENAME" },
		to_temp_file = true,
		prepend_extra_args = true,
	},
	factory = h.formatter_factory,
})

local sources = {
	formatting.mix,
	formatting.gofumpt,
	goimportstidy,
	formatting.prettier,
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
