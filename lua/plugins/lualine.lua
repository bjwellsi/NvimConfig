return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "Kurren123/mssql.nvim" },
	config = function()
		local lualine_nightfly = require("lualine.themes.nightfly")

		local new_colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			black = "#000000",
		}

		lualine_nightfly.normal.a.bg = new_colors.blue
		lualine_nightfly.insert.a.bg = new_colors.green
		lualine_nightfly.visual.a.bg = new_colors.violet
		lualine_nightfly.command = {
			a = {
				gui = "bold",
				bg = new_colors.yellow,
				fg = new_colors.black, -- black
			},
		}

		require("lualine").setup({
			options = {
				theme = lualine_nightfly,
			},
			sections = {
				lualine_c = {
					require("mssql").lualine_component,
				},
			},
		})
	end,
}
