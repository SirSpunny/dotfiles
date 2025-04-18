local M = {}

M.plugin_title = "tw_integration"

--- Returns a list of formatted task strings for display
--- @param max_tasks number? Max number of tasks to return (optional)
--- @param filter string? filter string to pass to the export command (optional)
--- @return table
function M.get_task_lines(filter, max_tasks)
	local tasks = M.export(filter)
	if not tasks then
		return { "⚠️ Could not load tasks" }
	end

	local lines = {}
	for i, task in ipairs(tasks) do
		if max_tasks and i > max_tasks then
			break
		end
		local desc = task.description or "No description"
		local proj = task.project and ("(" .. task.project .. ")") or ""
		local pri = task.priority or "-"
		table.insert(lines, string.format("[%s] %s %s", pri, desc, proj))
	end

	if #lines == 0 then
		table.insert(lines, "✅ No pending tasks")
	end

	return lines
end

--- Adds a new Taskwarrior Task
--- @param user_input string Task specification utilizing the Taskwarrior syntax
--- @return boolean, string
function M.add(user_input)
	-- Validate input
	if not user_input or (user_input and user_input:gsub("%s+", "") == "") then
		return false, "Task description cannot be empty"
	end

	local usr_project = user_input:match("project:(%w+)")
	if not usr_project then
		user_input = user_input .. " project:forced"
	end

	local ok, out_msg = M.run("add " .. user_input)
	if ok then
		-- Notify user of success
		local task_id = out_msg:match("Created task (%d+)")
		local msg = task_id and "Task " .. task_id .. " created successfully" or "Task created successfully"
		vim.notify(msg, vim.log.levels.INFO)

		return true, msg
	else
		local msg = "Failed to create task"
		vim.notify(msg, vim.log.levels.WARN)
		return false, msg
	end
end

--- Utilizes the Taskwarrior `task export` command to generate a list of Tasks
--- @param filter string? filter string to apply to the export command (optional)
--- @return table|nil
function M.export(filter)
	local cmd = "export"
	if filter then
		cmd = filter .. " export"
	end

	local ok, data = M.run(cmd)

	if data == "" then
		local msg = "No output from `" .. cmd .. "`"
		vim.notify(msg, vim.log.levels.WARN)
		return nil
	end

	local ok, tasks = pcall(vim.json.decode, data)
	if not ok or type(tasks) ~= "table" then
		local msg = "Failed to decode task JSON"
		vim.notify(msg, vim.log.levels.ERROR)
		return nil
	end

	return tasks
end

--- Validates, sanitizes and runs Taskwarrior commands
--- @param input string The Taskwarrior command to sanitize, run and validate
--- @return boolean, any
function M.run(input)
	if not input or input:gsub("%s+", "") == "" then
		return false, "Missing input arguments"
	end

	-- sanitization
	local args = vim.split(input, "%s+")
	local escaped_args = vim.tbl_map(vim.fn.shellescape, args)
	local command = "task " .. table.concat(escaped_args, " ")

	local output = vim.fn.system(command)

	-- Check if command succeeded
	if vim.v.shell_error ~= 0 then
		local msg = M.plugin_title .. " failed to run: " .. output
		vim.notify(msg, vim.log.levels.ERROR)
		return false, msg
	end

	return true, output
end

return M
