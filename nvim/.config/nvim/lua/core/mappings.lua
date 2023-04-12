local keymap = vim.keymap

-- core
vim.g.mapleader = " "

-- telescope
keymap.set("n", "<leader>ff", "<cmd> Telescope find_files hidden=true <CR>")
keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")

-- neo-tree
keymap.set("n", "<leader>fe", "<cmd> NvimTreeToggle <CR>")

-- move in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor on J
keymap.set("n", "J", "mzJ`z")

-- refocus when scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- tmux-sessionizer
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/tmux-sessionizer<CR>")

-- quick search and replace on word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- lazygit
local util = require("lazy.util")
keymap.set("n", "<leader>gg", function()
	util.float_term({ "lazygit" })
end)
