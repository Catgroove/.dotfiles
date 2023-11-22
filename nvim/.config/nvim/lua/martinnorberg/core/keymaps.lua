local keymap = vim.keymap

-- core
vim.g.mapleader = " "

-- telescope
keymap.set("n", "<leader>fs", "<cmd> Telescope find_files hidden=true <CR>")
keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")

-- move through wrapped lines
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- jump to next match, replace and start editing
keymap.set("n", "<leader><tab>", "gnc")

-- neo-tree
keymap.set("n", "<leader>fe", "<cmd> NvimTreeToggle <CR>")

-- buffers
keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")

-- move in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- yank without moving cursor in visual mode
keymap.set("v", "y", "ygv<Esc>")

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
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]])
