local keymap = vim.keymap

local on_attach = function(_, bufnr)
	local opts = {buffer = bufnr, remap = false}
	keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	keymap.set("n", "ca", function() vim.lsp.buf.code_action() end, opts)

end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local lspconfig = require "lspconfig"
local servers = { "lua_ls", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

