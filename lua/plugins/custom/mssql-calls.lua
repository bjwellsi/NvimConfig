vim.api.nvim_create_user_command("RunSQLToCSV", function()
	local sqlfile = vim.fn.expand("%:p")
	local tmp = os.tmpname() .. ".csv"

	--load .envs
	--load sql connection strings
	vim.cmd.Dotenv(vim.loop.os_homedir() .. "/.config/sql/connections/stellify.env")
	local db = vim.env.DB_NAME
	local user = vim.env.DB_USER
	local password = vim.env.DB_PASS
	local server = vim.env.DB_HOST

	local cmd = string.format(
		"tmux split-window -v 'sqlcmd -S %s -d %s -U %s -P %s -i %s -s \",\" -W -h -1 > %s && nvim %s; rm %s'",
		server,
		db,
		user,
		password,
		sqlfile,
		tmp,
		tmp,
		tmp
	)

	os.execute(cmd)
end, {})

-- Only add autocmd if CsvView is available
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*.csv",
	callback = function()
		local ok, _ = pcall(require, "csvview")
		if ok then
			vim.cmd("silent! CsvViewEnable")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "sql",
	callback = function()
		vim.keymap.set("n", "<leader>ss", ":RunSQLToCSV<CR>", { buffer = true, desc = "Run SQL and view as CSV" })
	end,
})
