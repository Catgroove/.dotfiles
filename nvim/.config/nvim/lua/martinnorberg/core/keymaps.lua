local keymap = vim.keymap

-- core
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- alternate file
keymap.set("n", "<leader>w", "<c-^>")

-- paste yank with newline, inline
keymap.set("x", "<leader>p", '"_dP')

-- move through wrapped lines
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- move through quickfix list
keymap.set("n", "<leader>cn", vim.cmd.cnext)
keymap.set("n", "<leader>cp", vim.cmd.cprev)
keymap.set("n", "<leader>co", vim.cmd.copen)
keymap.set("n", "<leader>cc", vim.cmd.cclose)

-- toggle auto format
keymap.set("n", "<leader>uf", "<cmd> ToggleFormat<CR>")

-- jump to next match, replace and start editing
keymap.set("n", "<leader><tab>", "gnc")

-- -- nvim-tree
-- keymap.set("n", "<leader>fe", "<cmd> NvimTreeToggle <CR>")

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

-- jump to start and end of line
keymap.set("n", "H", "^")
keymap.set("n", "L", "$")

-- quick search and replace on word
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- select all
keymap.set("n", "<leader>A", "gg<S-v>G")

-- better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- new buffer
keymap.set("n", "<leader>fn", "<cmd>enew<cr>")

-- reload buffer
keymap.set("n", "<leader>fr", "<cmd>e!<cr>")
