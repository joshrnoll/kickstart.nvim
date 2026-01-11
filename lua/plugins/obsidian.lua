return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/Documents/Obsidian/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
		"nvim-treesitter",
	},
	opts = {
		-- Disable UI because render-markdown is installed and conflicts.
		-- I tried adding the recommended option in after/ftplugin/markdown.lua but it didn't work
		-- (I think because render-markdown does something similar already)
		-- https://github.com/epwalsh/obsidian.nvim/issues/286
		ui = {
			enable = false,
		},
		workspaces = {
			{
				name = "zettelkasten",
				path = "~/Documents/Obsidian/zettelkasten/",
				overrides = {
					new_notes_location = "current_dir",
					templates = {
						folder = "Templates",
					},
				},
			},
			{
				name = "para",
				path = "~/Documents/Obsidian/para/",
				overrides = {
					notes_subdir = "1-Inbox",
					templates = {
						folder = "3-areas/Templates",
						date_format = "%Y-%m-%d",
						time_format = "%H:%M:%S-0:400",
					},
				},
			},
			{
				name = "gtd",
				path = "~/Documents/Obsidian/gtd/",
				overrides = {
					notes_subdir = "In-Tray",
					templates = {
						folder = "Templates",
						date_format = "%Y-%m-%d",
						time_format = "%H:%M:%S-0:400",
					},
				},
			},
		},
		picker = {
			name = "telescope.nvim",
			note_mappings = {
				new = "<C-x>",
				insert_link = "<C-y>",
			},
			tag_mappings = {
				new = "<C-x>",
				insert_tag = "<C-y>",
			},
		},
		new_notes_location = "notes_subdir",
		completion = {
			nvim_cmp = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},
	},
	keys = {
		{
			"<leader>ow",
			"<Cmd>ObsidianWorkspace<CR>",
			mode = "n",
			desc = "Change [O]bsidian [W]orkspace",
		},
		{ "<leader>oz", "<Cmd>ObsidianNew<CR>", mode = "n", desc = "[O]bsidian [Z]ettelkasten" },
		{ "<leader>on", "<Cmd>ObsidianNewFromTemplate<CR>", mode = "n", desc = "[O]bsidian [N]ew (from template)" },
		{ "<leader>os", "<Cmd>ObsidianSearch<CR>", mode = "n", desc = "[O]bsidian [S]earch" },
		{ "<leader>oq", "<Cmd>ObsidianQuickSwitch<CR>", mode = "n", desc = "[O]bsidian [Q]uickswitch" },
		{ "<leader>olf", "<Cmd>ObsidianFollowLink<CR>", mode = "n", desc = "[O]bsidian [L]ink [F]ollow " },
		{
			"<leader>olq",
			"<Cmd>ObsidianLink<CR>",
			mode = { "v", "n" },
			desc = "[O]bsidian [L]ink [Q]uery - Query for selection, link to matching note",
		},
		{
			"<leader>oln",
			"<Cmd>ObsidianLinkNew<CR>",
			mode = { "v", "n" },
			desc = "[O]bsidia [L]ink [N]ew - Create a new note and link to it",
		},
	},
}
