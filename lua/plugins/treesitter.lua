return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local function disable_function(lang, buf)
			local max_string_chars = 40000
			local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

			local in_string = false
			local current_string = ""

			for _, line in ipairs(lines) do
				for c in line:gmatch(".") do
					if c == '"' then
						if in_string then
							if #current_string > max_string_chars then
								vim.schedule(function()
									vim.notify(
										"Disabling Tree-sitter highlight: huge string literal detected",
										vim.log.levels.WARN
									)
								end)
								return true
							end
							current_string = ""
						end
						in_string = not in_string
					elseif in_string then
						current_string = current_string .. c
					end
				end
			end

			return false
		end
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"json",
				"lua",
				"javascript",
				"typescript",
				"html",
				"tsx",
				"css",
				"markdown",
				"markdown_inline",
				"svelte",
				"graphql",
				"bash",
				"vim",
				"dockerfile",
				"gitignore",
			},
			highlight = { enable = true, disable = disable_function },
			indent = { enable = true },
			autotag = { enable = true },
		})
	end,
}
