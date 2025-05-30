return {
	"Kurren123/mssql.nvim",
	dependencies = { "folke/which-key.nvim" },
	config = function()
		local mssql = require("mssql")

		mssql.setup({
			max_column_width = 1000,
		}, function()
			mssql.set_keymaps("<leader>m")
		end)
	end,
}
