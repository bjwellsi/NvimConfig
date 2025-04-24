local env = require("braiden.sql.env")

vim.api.nvim_create_user_command("PgConnect", function(opts)
	env.load_env(opts.args)
end, { nargs = 1, complete = "file" })

vim.api.nvim_create_user_command("PgRun", function()
	if not vim.g.db_connection_cmd then
		vim.notify("No connection set. Use :PgConnect <profile>", vim.log.levels.ERROR)
		return
	end
	local file = vim.fn.expand("%:p")
	local cmd = string.format('%s -f "%s"', vim.g.db_connection_cmd, file)
	local full = "bash -c " .. vim.fn.shellescape(cmd)
	vim.cmd("split | terminal " .. full)
end, {})

vim.api.nvim_create_user_command("PgShell", function()
	if not vim.g.db_connection_cmd then
		vim.notify("No connection set. Use :PgConnect <profile>", vim.log.levels.ERROR)
		return
	end
	local full = "bash -c " .. vim.fn.shellescape(vim.g.db_connection_cmd)
	vim.cmd("split | terminal " .. full)
end, {})
