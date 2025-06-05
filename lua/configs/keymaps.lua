vim.g.mapleader = " "

vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev WA wa")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev QA qa")

local keymap = vim.keymap --for conciseness

keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

keymap.set("n", "<leader>q", ":NvimTreeClose<CR>:q<CR>") -- close tree, then quit
keymap.set("n", "<leader>qw", ":NvimTreeClose<CR>:wq<CR>") -- close tree, then quit

keymap.set("n", "<leader>nh", ":nohl<CR>") --clear search highlighting

keymap.set("n", "x", '"_x') --don't copy x into register

keymap.set("n", "<leader>sv", "<C-w>v") --split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") --split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") --make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") --close current split window

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") --close tree
keymap.set("n", "<leader>w", ":NvimTreeFocus<CR>") --switch to tree

keymap.set("n", "<leader>ff", ":Telescope find_files<CR>") --find files
keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>") --grep files
keymap.set("n", "<leader>fb", ":Telescope buffers<CR>") --buffers files
keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>") --help files
