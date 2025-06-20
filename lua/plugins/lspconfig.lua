return {
	"neovim/nvim-lspconfig",
	dependencies = { "ellisonleao/dotenv.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		--capabilities from nvim-cmp
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if ok then
			capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
		end

		--load .envs
		--load sql connection strings
		vim.cmd.Dotenv(vim.loop.os_homedir() .. "/.config/sql/connections/stellify.env")

		--common on_attach logic
		local on_attach = function(_, bufnr)
			local keymap = vim.keymap
			-- keybind options
			local opts = { noremap = true, silent = true, buffer = bufnr }

			-- set keybinds
			keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts) -- show definition, references
			keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts) -- got to declaration
			keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- see definition and make edits in window
			keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts) -- go to implementation
			keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- see available code actions
			keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- smart rename
			keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- show  diagnostics for line
			keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- show diagnostics for cursor
			keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- jump to previous diagnostic in buffer
			keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- jump to next diagnostic in buffer
			keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- show documentation for what is under cursor
			keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts) -- see outline on right hand side
		end

		-- Configure servers
		vim.lsp.config("ts_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("html", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("tailwindcss", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("csharp_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("bashls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		--[[
		vim.lsp.config("sqls", {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				sqls = {
					connections = {
						{
							driver = "mssql",
							dataSourceName = vim.env.MSQL_DSN,
						},
					},
				},
			},
		})
    ]]

		vim.lsp.config("dockerls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		vim.lsp.config("jsonls", {
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- Enable servers
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("html")
		vim.lsp.enable("csharp_ls")
		vim.lsp.enable("bashls")
		vim.lsp.enable("lua_ls")
		--vim.lsp.enable("sqls")
		vim.lsp.enable("jsonls")
		vim.lsp.enable("dockerls")
		vim.lsp.enable("cssls")
		vim.lsp.enable("tailwindcss")
	end,
}
