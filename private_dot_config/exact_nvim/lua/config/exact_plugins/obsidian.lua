if vim.env.OBSIDIAN_VAULT_ROOT then
	Obsidian_vault_root = vim.env.OBSIDIAN_VAULT_ROOT
else
	Obsidian_vault_root = "~/vaults"
end

return {
	"obsidian-nvim/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		-- A list of workspace names, paths, and configuration overrides.
		-- If you use the Obsidian app, the 'path' of a workspace should generally be
		-- your vault root (where the `.obsidian` folder is located).
		-- When obsidian.nvim is loaded by your plugin manager, it will automatically set
		-- the workspace to the first workspace in the list whose `path` is a parent of the
		-- current markdown file being edited.
		workspaces = {
			{
				name = "personal",
				path = Obsidian_vault_root .. "/personal",
			},
			{
				name = "work",
				path = Obsidian_vault_root .. "/work",
			},
		},

		-- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
		-- 'workspaces'. For example:
		-- dir = "~/vaults/work",

		-- Optional, if you keep notes in a specific subdirectory of your vault.
		notes_subdir = "notes",

		-- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
		-- levels defined by "vim.log.levels.*".
		log_level = vim.log.levels.INFO,

		daily_notes = {
			-- Optional, if you keep daily notes in a separate directory.
			folder = "notes/dailies",
			-- Optional, if you want to change the date format for the ID of daily notes.
			date_format = "%Y-%m-%d",
			-- Optional, if you want to change the date format of the default alias of daily notes.
			alias_format = "%B %-d, %Y",
			-- Optional, default tags to add to each new daily note created.
			default_tags = { "daily-notes" },
			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = nil,
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			-- Enables completion using nvim_cmp
			nvim_cmp = false,
			-- Enables completion using blink.cmp
			blink = true,
			-- Trigger completion at 2 chars.
			min_chars = 2,
		},
	},
}
