--requires make and ripgrep to be installed
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			mappings = {
				i = {
					--map which key to <C-h>
					["<C-h>"] = "which_key",
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
