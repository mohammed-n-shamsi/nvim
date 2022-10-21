local set = vim.opt

vim.notify = require("notify")

set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.expandtab = true

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true
set.smartindent = true
set.autoindent = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true

set.relativenumber = true
set.number = true

set.cursorline = true
set.hidden = true

set.showmode = false

set.grepprg = "rg --hidden --vimgrep --smart-case --"

vim.g.tex_flavor = "latex"

-- Disable the vile mouse
set.mouse = nil
