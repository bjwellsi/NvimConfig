local M = {}

function M.run_tool(dialect, folder, tool, param)
	local tool_path = string.format("%s/.config/sql/scripts/%s/%s/%s.sql", os.getenv("HOME"), dialect, folder, tool)

	local file = io.open(tool_path, "r")
	if not file then
		vim.notify("Tool not found: " .. tool_path, vim.log.levels.ERROR)
		return
	end

	local query = file:read("*a")
	file:close()

	local final_query = query:gsub("{{pattern}}", param)
	local cmd = string.format('%s -Q "%s"', vim.g.db_connection_cmd, final_query)
	local result = vim.fn.system("bash -c " .. vim.fn.shellescape(cmd))

	-- Create new vertical split scratch buffer and dump result
	vim.cmd("new")
	vim.bo.buftype = "nofile"
	vim.bo.bufhidden = "wipe"
	vim.bo.swapfile = false
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(result, "\n"))
end

vim.api.nvim_create_user_command("FindProc", function(opts)
	M.run_tool("mssql", "global", "find_proc", opts.args)
end, { nargs = 1 })

return M
