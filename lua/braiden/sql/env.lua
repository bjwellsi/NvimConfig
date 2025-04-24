local M = {}

function M.load_env(profile)
	local path = vim.fn.expand("~/.config/sql/connections/" .. profile .. ".env")
	vim.notify("Loading profile: " .. path, vim.log.levels.INFO)

	local file = io.open(path, "r")
	if not file then
		vim.notify("DB profile not found: " .. profile, vim.log.levels.ERROR)
		return
	end

	local config = {}
	for line in file:lines() do
		-- Remove comments and trim whitespace
		line = line:gsub("#.*$", ""):match("^%s*(.-)%s*$")
		local k, v = line:match("^([%w_]+)%s*=%s*(.+)$")
		if k and v then
			config[k] = v
		end
	end
	file:close()

	if not config.DB_TYPE then
		vim.notify("Could not parse DB_TYPE", vim.log.levels.ERROR)
		return
	end

	local cmd = ""
	if config.DB_TYPE == "mssql" then
		cmd = string.format(
			"sqlcmd -S %s -U %s -P '%s' -d %s",
			config.DB_HOST,
			config.DB_USER,
			config.DB_PASS,
			config.DB_NAME
		)
	elseif config.DB_TYPE == "postgres" then
		cmd = string.format(
			"psql postgresql://%s:%s@%s:%s/%s",
			config.DB_USER,
			config.DB_PASS,
			config.DB_HOST,
			config.DB_PORT or "5432",
			config.DB_NAME
		)
	else
		vim.notify("Unknown DB_TYPE: " .. tostring(config.DB_TYPE), vim.log.levels.ERROR)
		return
	end

	vim.g.db_connection_cmd = cmd
	vim.notify("Set db_connection_cmd: " .. cmd)
end

return M
