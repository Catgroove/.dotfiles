-- Core
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) 

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files hidden=true <CR>")
vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")

