return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				keys = {
					{
						"<leader>do",
						function()
							require("dapui").toggle({})
						end,
						desc = "Dap UI",
					},
					{
						"<leader>de",
						function()
							require("dapui").eval()
						end,
						desc = "Eval",
						mode = { "n", "v" },
					},
				},
				opts = {},
				config = function(_, opts)
					-- setup dap config by VsCode launch.json file
					-- require("dap.ext.vscode").load_launchjs()
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end
				end,
			},
		},
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
			},
			{
				"<leader>dc",
				function()
					require("dap").clear_breakpoints()
				end,
			},
			{
				"<leader>dq",
				function()
					require("dap").terminate()
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
					require("dap-go").debug_last_test()
				end,
			},
		},
	},
}
