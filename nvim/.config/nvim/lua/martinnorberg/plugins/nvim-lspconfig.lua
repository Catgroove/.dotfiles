return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
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
			keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
			keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>")
			keymap.set("n", "gs", "<cmd>Telescope lsp_document_symbols<CR>")
			keymap.set("n", "gI", "<cmd>Telescope lsp_implementations<CR>", opts)
			keymap.set("n", "K", vim.lsp.buf.hover, opts)
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			keymap.set("n", "<leader>co", vim.diagnostic.open_float, opts)
			keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")
		local servers = { "lua_ls" }

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end

		local function organize_imports()
			local params = {
				command = "_typescript.organizeImports",
				arguments = { vim.api.nvim_buf_get_name(0) },
			}

			vim.lsp.buf.execute_command(params)
		end

		lspconfig.tsserver.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			commands = {
				OrganizeImports = {

					organize_imports,
					description = "Organize Imports",
				},
			},
		})

		lspconfig.elixirls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			cmd = { "elixir-ls" },
			root_dir = util.root_pattern("mix.exs"),
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
