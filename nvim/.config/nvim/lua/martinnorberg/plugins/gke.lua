return {
	{
		"gke-opener",
		dir = vim.fn.stdpath("config") .. "/lua/gke-opener",
		config = function()
			vim.keymap.set("n", "<leader>gke", function()
				require("gke-opener").open_in_gcp()
			end, {
				noremap = true,
				silent = true,
				desc = "Open GKE deployment in GCP",
			})
		end,
	},
}
