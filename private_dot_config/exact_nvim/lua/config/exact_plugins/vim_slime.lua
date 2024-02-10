return {
	"jpalardy/vim-slime",
	lazy = true,
	cmd = "SlimeConfig",
	config = function()
		vim.g.slime_bracketed_paste = 1
		vim.g.slime_target = "tmux"
		-- don't jump back to the original cursor position
		-- vim.g.slime_preserve_curpos = 0
		-- require("vim-slime").setup()
		vim.keymap.set("x", "<C-c><C-c>", ":<c-u>call slime#send_op(visualmode(), 1)<cr>`>G")
	end,
}
