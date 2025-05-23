vim.g.mapleader = " "

local keymap = vim.keymap --for conciseness

--general keymaps
keymap.set("i", "jk", "<ESC>") --exit insert with jk

keymap.set("n", "<leader>q", ":NvimTreeClose<CR>:q<CR>") -- close tree, then quit

keymap.set("n", "<leader>nh", ":nohl<CR>") --clear search highlighting

keymap.set("n", "x", '"_x') --don't copy x into register

keymap.set("n", "<leader>sv", "<C-w>v") --split window vertically
--keymap.set("n", "<leader>sh", "<C-w>s")--split window horizontally
--keymap.set("n", "<leader>se", "<C-w>=")--make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") --close current split window

--keymap.set("n", "<leader>to", ":tabnew<CR>")--open new tab
--keymap.set("n", "<leader>tx", ":tabclose<CR>")--close current tab
--keymap.set("n", "<leader>tn", ":tabn<CR>")--go to next tab
--keymap.set("n", "<leader>tp", ":tabp<CR>")--go to previous tab

--plugin keymaps

--nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") --change the toggle command
keymap.set("n", "<leader>w", ":NvimTreeFocus<CR>") --change the toggle command

--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
--keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
