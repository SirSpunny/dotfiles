return {
	dir = vim.fn.stdpath("config") .. "/lua/tw_integration",
	name = "Taskwarrior Integration",
	cmd = { "TaskList", "TaskAdd" }, -- Only loads when this command is called
	config = function()
		local tw = require("tw_integration")

		vim.api.nvim_create_user_command("TaskList", function(args)
			local tasks = tw.get_task_lines()
			vim.print(tasks)
		end, { desc = "List Taskwarrior Tasks" })

		vim.api.nvim_create_user_command("TaskAdd", function(args)
			local ok, msg = tw.add(args.args)
		end, { desc = "Add a Taskwarrior Task", nargs = "?" })
	end,
}
