local keymap = vim.keymap

-- core
vim.g.mapleader = " "

-- alternate file
keymap.set("n", "<leader>w", "<c-^>")

-- telescope
keymap.set("n", "<leader>fs", "<cmd> Telescope find_files hidden=true <CR>")
keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
keymap.set("n", "<leader>fg", "<cmd> Telescope live_grep <CR>")
keymap.set("n", "<leader>fw", "<cmd> Telescope grep_string <CR>")
keymap.set("n", "<leader>fd", "<cmd> Telescope diagnostics <CR>")

-- paste yank with newline, inline
keymap.set("x", "<leader>p", '"_dP')

-- spectre
keymap.set("n", "<leader>S", "<cmd> lua require('spectre').toggle() <CR>")

-- move through wrapped lines
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- move through quickfix list
keymap.set("n", "<leader>qn", vim.cmd.cnext)
keymap.set("n", "<leader>qp", vim.cmd.cprev)

-- jump to next match, replace and start editing
keymap.set("n", "<leader><tab>", "gnc")

-- nvim-tree
keymap.set("n", "<leader>fe", "<cmd> NvimTreeToggle <CR>")

-- move in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- yank without moving cursor in visual mode
keymap.set("v", "y", "ygv<Esc>")

-- keep cursor on J
keymap.set("n", "J", "mzJ`z")

-- refocus when navigation
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("n", "<C-i>", "<C-i>zz")
keymap.set("n", "<C-o>", "<C-o>zz")
keymap.set("n", "G", "Gzz")

-- tmux-sessionizer
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- quick search and replace on word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- select all
keymap.set("n", "<leader>A", "gg<S-v>G")

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- new file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>")

-- reload buffer
keymap.set("n", "<leader>fr", "<cmd>e!<cr>")
