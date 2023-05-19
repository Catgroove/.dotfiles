local keymap = vim.keymap

local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>")
	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	keymap.set("n", "<leader>co", vim.diagnostic.open_float, opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local lspconfig = require("lspconfig")
local servers = { "lua_ls", "tsserver" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
