return {
	{
		"gke-opener",
		dir = vim.fn.stdpath("config") .. "/lua/gke-opener",
		config = function()
			require("gke-opener").setup({
				default_location = "europe-west1",
			})

			vim.keymap.set("n", "<leader>gke", function()
				require("gke-opener.init").open_in_gcp()
			end, {
				noremap = true,
				silent = true,
				desc = "Open GKE deployment in GCP",
			})
		end,
	},
}
