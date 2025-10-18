return {
	{
		"mfussenegger/nvim-dap",
        -- stylua: ignore
        config = function ()
          local sidebar
          local widgets = require("dap.ui.widgets")

          vim.keymap.set("n", "<leader>du", function()
            if sidebar == nil then
              sidebar = widgets.sidebar(widgets.scopes)
            end
            sidebar.toggle()
          end, { desc = "Toggle DAP UI" })

          vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
          vim.keymap.set("n", "<leader>dx", function() require("dap").clear_breakpoints() end, { desc = "Clear Breakpoints" })
          vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end, { desc = "Terminate/Quit DAP" })
          vim.keymap.set("n", "<leader>dq", function() require("dap").disconnect() end, { desc = "Terminate/Quit DAP" })
          vim.keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "Continue" })
          vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, { desc = "Step Into" })
          vim.keymap.set("n", "<leader>do", function() require("dap").step_over() end, { desc = "Step Over" })
          vim.keymap.set("n", "<leader>dO", function() require("dap").step_out() end, { desc = "Step Out" })
        end,
	},
	{
		"leoluz/nvim-dap-go",
		depdendencies = "mfussenegger/nvim-dap",
		ft = "go",
		config = function()
			require("dap-go").setup({
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
						host = "127.0.0.1",
						port = 2345,
					},
				},
			})
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
