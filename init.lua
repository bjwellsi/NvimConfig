require("braiden.plugins-setup")
require("braiden.core.options")
require("braiden.core.keymaps")
require("braiden.core.colorscheme")
require("braiden.plugins.nvim-tree")
require("braiden.plugins.lualine")
require("braiden.plugins.telescope")
require("braiden.plugins.nvim-cmp")
require("braiden.plugins.lsp.mason")
require("braiden.plugins.lsp.lspsaga")
require("braiden.plugins.lsp.lspconfig")
require("braiden.plugins.treesitter")
require("braiden.plugins.lsp.null-ls")
require("braiden.plugins.autopairs")
require("braiden.plugins.gitsigns")
require("braiden.plugins.nvim-tree-preview")
require("braiden.plugins.dadbod")
require("braiden.plugins.friendly-snippets")

vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev WA wa")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev Qa qa")
vim.cmd("cnoreabbrev QA qa")
