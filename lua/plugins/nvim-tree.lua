return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		git = {
			enable = true,
			ignore = false,
		},
		filters = {
			git_ignored = false,
			custom = { "^.git$", "^node_modules$" },
		},
		renderer = {
			icons = {
				glyphs = {
					folder = {
						arrow_closed = "",
						arrow_open = "",
					},
				},
			},
		},
	},
}
