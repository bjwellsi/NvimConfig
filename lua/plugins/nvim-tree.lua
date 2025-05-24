return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
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
