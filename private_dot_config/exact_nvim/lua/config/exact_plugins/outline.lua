return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
		{ "<leader>t", "<cmd>OutlineFocus<CR>", desc = "Toggle outline focus" },
	},
	opts = {
		outline_window = { auto_close = false },
		keymaps = { goto_and_close = "j", goto_location = "<CR>" },
		symbol_folding = { auto_unfold = { hovered = false } },
	},
}
