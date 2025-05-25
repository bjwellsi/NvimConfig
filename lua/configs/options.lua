local opt = vim.opt

vim.log.levels.DEFAULT = vim.log.levels.WARN

--appearance
opt.termguicolors = true
opt.signcolumn = "yes"
opt.background = "dark"

--line #s
opt.relativenumber = true
opt.number = true

--tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

--line wrapping
opt.wrap = false

--search settings
opt.ignorecase = true --ignore case by default
opt.smartcase = true --but be case sensitive if I search using a capital

--cursor
opt.cursorline = true

--backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus") --use system keyboard when yank/copy

--split windows
opt.splitright = true
opt.splitbelow = true
