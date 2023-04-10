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
