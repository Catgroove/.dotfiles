-- core
vim.g.mapleader = " "

-- telescope
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files hidden=true <CR>")
vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")

-- neo-tree
vim.keymap.set("n", "<leader>fe", "<cmd> Neotree toggle <CR>")

-- move in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor on J
vim.keymap.set("n", "J", "mzJ`z")

-- refocus when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/tmux-sessionizer<CR>")

-- quick search and replace on word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
