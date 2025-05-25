return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
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
