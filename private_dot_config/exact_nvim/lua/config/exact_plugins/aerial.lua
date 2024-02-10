return {
	"stevearc/aerial.nvim",
	opts = {
		layout = { min_width = 20, width = nil, max_width = { 40, 0.2 }, resize_to_content = true },
		autojump = true,
		highlight_on_hover = true,
		highlight_on_jump = false,
		keymaps = {
			["<ESC>"] = "actions.close",
			["<TAB>"] = "actions.tree_toggle",
			["<S-TAB>"] = "actions.tree_toggle_recursive",
			["<Right>"] = "actions.tree_increase_fold_level",
			["<Left>"] = "actions.tree_decrease_fold_level",
		},
		filter_kind = false,
		close_on_select = true,
		float = { relative = "editor" },
	},
	keys = { { "<Leader>a", "<cmd>AerialToggle<CR>" } },
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
