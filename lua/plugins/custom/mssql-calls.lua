vim.api.nvim_create_user_command("RunSQLToCSV", function()
	local sqlfile = vim.fn.expand("%:p")
	local content = io.open(sqlfile):read("*a")

	--load .envs
	--load sql connection strings
	vim.cmd.Dotenv(vim.loop.os_homedir() .. "/.config/sql/connections/stellify.env")
	local db = vim.env.DB_NAME
	local user = vim.env.DB_USER
	local password = vim.env.DB_PASS
	local server = vim.env.DB_HOST
	local server_full = vim.env.DB_HOST_FULL

	--split req into GO block
	local blocks = vim.split(content, "\n%s*GO%s*\n", { trimempty = true })

	for _, block in ipairs(blocks) do
		-- Ensure semicolon at the end if missing
		if not block:match(";%s*$") then
			block = block .. ";"
		end

		-- Write to temp .sql and .csv
		local tmp_sql = os.tmpname() .. ".sql"
		local tmp_csv = os.tmpname() .. ".csv"

		local f = io.open(tmp_sql, "w")
		f:write(block)
		f:close()

		local cmd = string.format(
			"tmux split-window -v 'usql \"sqlserver://%s:%s@%s/%s\" -f %s --csv > %s 2>&1; nvim %s; rm %s %s'",
			user,
			password,
			server_full,
			db,
			tmp_sql,
			tmp_csv,
			tmp_csv,
			tmp_sql,
			tmp_csv
		)

		os.execute(cmd)
	end

	--[[
	local cmd = string.format(
		--"tmux split-window -v 'sqlcmd -S %s -d %s -U %s -P %s -i %s -s \",\" -W -h 1 -u > %s && nvim %s; rm %s'",
		"tmux split-window -v 'usql \"sqlserver://%s:%s@%s/%s\" -f %s --csv > %s 2>&1; nvim %s; rm %s'",
		user,
		password,
		server_full,
		db,
		sqlfile,
		tmp,
		tmp,
		tmp
	)

	os.execute(cmd)
  -]]
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
		vim.keymap.set("n", "<leader>ss", function()
			vim.cmd("write")
			vim.cmd("RunSQLToCSV")
		end, { buffer = true, desc = "Save and run sql" })
	end,
})
