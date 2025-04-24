local env = require("braiden.sql.env")

vim.api.nvim_create_user_command("MsConnect", function(opts)
	env.load_env(opts.args)
end, { nargs = 1, complete = "file" })

vim.api.nvim_create_user_command("MsRun", function()
	if not vim.g.db_connection_cmd then
		vim.notify("No connection set. Use :MsConnect <profile>", vim.log.levels.ERROR)
		return
	end
	local file = vim.fn.expand("%:p")
	local full_cmd = string.format('%s -i "%s"', vim.g.db_connection_cmd, file)

	-- Quote entire thing and run in shell safely
	vim.cmd("split | terminal bash -c " .. vim.fn.shellescape(full_cmd))
end, {})

vim.api.nvim_create_user_command("MsShell", function()
	if not vim.g.db_connection_cmd then
		vim.notify("No connection set. Use :msConnect <profile>", vim.log.levels.ERROR)
		return
	end
	vim.cmd("split | terminal " .. vim.g.db_connection_cmd)
end, {})
