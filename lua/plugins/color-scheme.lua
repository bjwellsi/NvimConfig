return {
	"bluz71/vim-nightfly-colors",
	lazy = false, -- load at startup
	priority = 1000, -- load before other UI plugins
	config = function()
		vim.cmd("colorscheme nightfly")
	end,
}
