return {
	"sindrets/diffview.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	config = function()
		local actions = require("diffview.actions")

		require("diffview").setup({
			diff_binaries = false, -- Show diffs for binaries
			enhanced_diff_hl = false, -- See |diffview-config-enhanced_diff_hl|
			git_cmd = { "git" }, -- The git executable followed by default args
			use_icons = true, -- Requires nvim-web-devicons
			show_help_hints = true, -- Show hints for how to open the help panel
			watch_index = true, -- Update views and index buffers when the git index changes

			view = {
				default = {
					layout = "diff2_horizontal",
					disable_diagnostics = false,
					winbar_info = false,
				},
				merge_tool = {
					layout = "diff3_horizontal",
					disable_diagnostics = true,
					winbar_info = true,
				},
				file_history = {
					layout = "diff2_horizontal",
					disable_diagnostics = false,
					winbar_info = false,
				},
			},

			file_panel = {
				listing_style = "tree",
				tree_options = {
					flatten_dirs = true,
					folder_statuses = "only_folded",
				},
				win_config = {
					position = "left",
					width = 35,
					win_opts = {},
				},
			},

			file_history_panel = {
				win_config = {
					position = "bottom",
					height = 16,
					win_opts = {},
				},
			},

			keymaps = {
				view = {
					{ "n", "<tab>", actions.select_next_entry, { desc = "Open diff for next file" } },
					{ "n", "<s-tab>", actions.select_prev_entry, { desc = "Open diff for previous file" } },
					{ "n", "gf", actions.goto_file_edit, { desc = "Open file in previous tabpage" } },
					{ "n", "<leader>e", actions.focus_files, { desc = "Focus file panel" } },
					{ "n", "<leader>vf", actions.toggle_files, { desc = "Toggle file panel" } },
				},
				file_panel = {
					{ "n", "j", actions.next_entry, { desc = "Next file entry" } },
					{ "n", "k", actions.prev_entry, { desc = "Previous file entry" } },
					{ "n", "<cr>", actions.select_entry, { desc = "Open diff for selected entry" } },
					{ "n", "-", actions.toggle_stage_entry, { desc = "Stage/unstage selected entry" } },
					{ "n", "S", actions.stage_all, { desc = "Stage all entries" } },
					{ "n", "U", actions.unstage_all, { desc = "Unstage all entries" } },
					{ "n", "X", actions.restore_entry, { desc = "Restore entry to left side state" } },
					{ "n", "R", actions.refresh_files, { desc = "Refresh file list" } },
					{ "n", "<leader>e", actions.focus_files, { desc = "Focus file panel" } },
					{ "n", "<leader>ft", actions.toggle_files, { desc = "Toggle file panel" } },
				},
			},
		})
	end,
	keys = {
		-- Searches
		{ "<leader>vo", ":DiffviewOpen<CR>" },
		{ "<leader>vc", ":DiffviewClose<CR>" },
		{ "<leader>vr", ":DiffviewRefresh<CR>" },
	},
}
