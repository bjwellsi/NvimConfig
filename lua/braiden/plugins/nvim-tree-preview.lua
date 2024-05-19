local preview = require("nvim-tree-preview")

-- Default config:
preview.setup({
	-- Keymaps for the preview window (does not apply to the tree window).
	-- Keymaps can be a string (vimscript command), a function, or a table.
	--
	-- If a table, it must contain either an 'action' or 'open' key:
	--
	-- Actions:
	--   { action = 'close', unwatch? = false, focus_tree? = true }
	--   { action = 'toggle_focus' }
	--
	-- Open modes:
	--   { open = 'edit' }
	--   { open = 'tab' }
	--   { open = 'vertical' }
	--   { open = 'horizontal' }
	--
	-- To disable a default keymap, set it to false.
	-- All keymaps are set in normal mode. Other modes are not currently supported.
	keymaps = {
		["<Esc>"] = { action = "close", unwatch = true },
		["<Tab>"] = { action = "toggle_focus" },
		["<CR>"] = { open = "edit" },
		["<C-t>"] = { open = "tab" },
		["<C-v>"] = { open = "vertical" },
		["<C-x>"] = { open = "horizontal" },
	},
	min_width = 10,
	min_height = 5,
	max_width = 85,
	max_height = 25,
	wrap = false, -- Whether to wrap lines in the preview window
	border = "rounded", -- Border style for the preview window
})
