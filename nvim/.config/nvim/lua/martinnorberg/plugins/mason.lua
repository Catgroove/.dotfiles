return {
	"williamboman/mason.nvim",
	config = function()
		require("mason").setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"typescript-language-server",
				"prettier",
				"eslint_d",
				"gopls",
			},
		})

		vim.api.nvim_create_user_command("MasonInstallAll", function()
			vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
		end, {})
		--			vim.g.mason_binaries_list = opts.ensure_installed
	end,
}
