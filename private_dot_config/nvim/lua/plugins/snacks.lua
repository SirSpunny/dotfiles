return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = {
			enabled = true,
			sections = {
				{ action = "", icon = "! ", title = "Tasks", indent = 2, height = 1 },
				{
					section = "terminal",
					cmd = "task rc.verbose=nothing calendar",
					indent = 2,
					padding = 2,
					height = 8,
					ttl = 0,
				},
				{
					section = "terminal",
					cmd = "task rc.verbose=nothing status:pending list",
					indent = 2,
					padding = 2,
					ttl = 0,
				},
				{
					pane = 2,
					icon = " ",
					title = "Recent Files",
					section = "recent_files",
					indent = 2,
					padding = 2,
					height = 6,
				},
				{
					pane = 2,
					icon = " ",
					title = "Projects",
					section = "projects",
					indent = 2,
					padding = 2,
					height = 6,
				},
				function()
					local in_git = Snacks.git.get_root() ~= nil
					local cmds = {
						enabled = in_git,
						icon = " ",
						title = "Git Status",
						section = "terminal",
						cmd = "git --no-pager diff --stat -B -M -C",
						pane = 2,
						height = 6,
						padding = 2,
						ttl = 5 * 60,
					}

					return cmds
				end,
				{ section = "startup", padding = 2, height = 1 },
			},
		},
		explorer = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
	keys = {
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>ef",
			function()
				Snacks.explorer()
			end,
			desc = "Toggle [e]xplore [f]iles",
		},
		{
			"<leader>ed",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Toggle [e]xplore [d]iagnostics",
		},
	},
}
