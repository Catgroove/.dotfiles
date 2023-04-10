require("core.mappings")
require("core.lazy")

local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = true

-- wrap
opt.wrap = true

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
