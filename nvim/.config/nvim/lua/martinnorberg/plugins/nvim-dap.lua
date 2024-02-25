return {
	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{
				"<leader>do",
				function()
					local widgets = require("dap.ui.widgets")
					local sidebar = widgets.sidebar(widgets.scopes)
					sidebar.toggle()
				end,
			},
		},
	},
	{
		"leoluz/nvim-dap-go",
		depdendencies = "mfussenegger/nvim-dap",
		ft = "go",
		config = function()
			require("dap-go").setup()
		end,
		keys = {
			{
				"<leader>dt",
				function()
					require("dap-go").debug_test()
				end,
			},
			{
				"<leader>dl",
				function()
					require("dap-go").debug_last()
				end,
			},
		},
	},
}
