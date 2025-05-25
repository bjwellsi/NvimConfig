return {
	"L3MON4D3/LuaSnip",
	dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load() --load friendly snippets
		require("luasnip.loaders.from_lua").lazy_load({ --load snippets folder (lua format)
			paths = vim.fn.stdpath("config") .. "/lua/plugins/snippets",
		})
	end,
}
