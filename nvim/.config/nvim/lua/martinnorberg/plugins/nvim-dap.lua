return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
			{
				"rcarriga/nvim-dap-ui",
                --stylua: ignore
				keys = {
					{ "<leader>du", function() require("dapui").toggle({}) end },
				},
				opts = {},
				config = function(_, opts)
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
				end,
			},
		},
        -- stylua: ignore
		keys = {
			{ "<leader>db", function() require("dap").toggle_breakpoint() end },
			{ "<leader>dx", function() require("dap").clear_breakpoints() end },
			{ "<leader>dq", function() require("dap").terminate() end },
			{ "<leader>dc", function() require("dap").continue() end },
			{ "<leader>di", function() require("dap").step_into() end },
			{ "<leader>do", function() require("dap").step_over() end },
			{ "<leader>dO", function() require("dap").step_out() end },
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
