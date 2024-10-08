local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = true

-- include "-" in word
-- opt.iskeyword:append("-")

-- wrap
opt.wrap = true
opt.breakindent = true

-- updatetime
opt.updatetime = 50

-- use osx clipboard
opt.clipboard = "unnamedplus"

-- casing
opt.ignorecase = true
opt.smartcase = true

-- sidebar
opt.signcolumn = "yes"

-- colors
opt.termguicolors = true

-- indent
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- highlight
opt.hlsearch = false
opt.incsearch = true

-- disable mode
opt.showmode = false

-- undofile
opt.undofile = true
opt.undolevels = 10000

-- casing
opt.ignorecase = true
opt.smartcase = true

-- scrolloff
opt.scrolloff = 8

-- disable swapfile
opt.swapfile = false

-- autoread buffes automatically
opt.autoread = true
