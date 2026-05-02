return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>lx", "<cmd>Lspsaga show_workspace_diagnostics<CR>", desc = "Workspace diagnostics (Lspsaga)" },
	},
	opts = {
		ui = {
			border = "rounded",
			title = true,
			devicon = true,
		},
		lightbulb = {
			enable = true,
			virtual_text = true,
		},
		symbol_in_winbar = {
			enable = false,
		},
	},
}
