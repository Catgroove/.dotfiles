return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Temporary during refactor of LSP config.
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(mode, keys, func, desc)
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("n", "<leader>rs", "<cmd>LspRestart<CR>", "[R]e[s]tart LSP")
				map("n", "gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
				map("n", "gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
				map("n", "gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
				map("i", "<C-k>", vim.lsp.buf.signature_help, "Hover documentation")
				map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
				map("n", "<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
				map("n", "<leader>co", vim.diagnostic.open_float, "Open Float")

				-- Go specific
				map("n", "<leader>ce", "<cmd>GoIfErr<CR>", "Go: Insert If Err")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						workspace = {
							checkThirdParty = false,
							library = {
								"${3rd}/luv/library",
								unpack(vim.api.nvim_get_runtime_file("", true)),
							},
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			gopls = {
				filetypes = { "go", "gomod", "gowork", "gotmpl" },
				root_dir = require("lspconfig/util").root_pattern("go.work", "go.mod", ".git"),
				settings = {
					gopls = {
						completeUnimported = true,
						analyses = {
							unusedparams = true,
						},
					},
				},
			},
			tsserver = {
				commands = {
					OrganizeImports = {
						function()
							local params = {
								command = "_typescript.organizeImports",
								arguments = { vim.api.nvim_buf_get_name(0) },
							}

							vim.lsp.buf.execute_command(params)
						end,
						"Organize TypeScript imports",
					},
				},
			},
		}

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			-- lua
			"stylua",

			-- go
			"gofumpt",
			"goimports",
			"golangci-lint",
			"delve",

			-- js/ts
			"prettierd",
			"eslint_d",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
