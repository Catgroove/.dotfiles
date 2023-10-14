return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("martinnorberg.plugins.configs.null-ls")
		end,
	},
	config = function()
		local keymap = vim.keymap

		local on_attach = function(_, bufnr)
			local opts = { buffer = bufnr, remap = false }
			keymap.set("n", "gd", vim.lsp.buf.definition, opts)
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>")
			keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>")
			keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
			keymap.set("n", "K", vim.lsp.buf.hover, opts)
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			keymap.set("n", "<leader>co", vim.diagnostic.open_float, opts)
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local servers = { "lua_ls", "tsserver" }

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end

		lspconfig.elixirls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "elixir-ls" },
		})

		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})
	end,
}
