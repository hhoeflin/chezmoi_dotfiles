return {
	"nvim-treesitter/nvim-treesitter",
	-- tag = "v0.9.3",
	build = function()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			-- One of "all", "maintained" (parsers with maintainers), or a list of languages
			ensure_installed = { "python", "markdown", "r", "make" },

			-- Install languages synchronously (only applied to `ensure_installed`)
			sync_install = false,

			-- List of parsers to ignore installing
			ignore_install = {},

			highlight = {
				-- `false` will disable the whole extension
				enable = true,
			},
		})
	end,
}
