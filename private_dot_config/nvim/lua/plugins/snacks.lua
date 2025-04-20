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
					key = "[<leader>sr]",
					section = "recent_files",
					indent = 2,
					padding = 2,
					height = 6,
				},
				{
					pane = 2,
					icon = " ",
					title = "Projects",
					key = "[<leader>sp]",
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
						key = "[<leader>gf]",
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
			desc = "smart find files",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "command history",
		},
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "[e]xplore files",
		},
		{
			"<leader>tt",
			function()
				Snacks.terminal()
			end,
			desc = "[t]oggle",
		},
		-- git
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gB",
			function()
				Snacks.gitbrowse()
			end,
			desc = "Git Browse",
			mode = { "n", "v" },
		},
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Git Files",
		},
		-- search
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help()
			end,
			desc = "Help Pages",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights()
			end,
			desc = "Highlights",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist()
			end,
			desc = "Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "Marks",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man()
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist()
			end,
			desc = "Quickfix List",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo()
			end,
			desc = "Undo History",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.projects()
			end,
			desc = "Projects",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent Files",
		},
	},
}
