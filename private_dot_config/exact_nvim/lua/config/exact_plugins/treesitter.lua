local treesitter_version = ""
if vim.fn.has("nvim-0.9.2") == 1 then
	treesitter_version = "v0.9.2"
else
	treesitter_version = "v0.9.1"
end

return {
	"nvim-treesitter/nvim-treesitter",
	tag = treesitter_version,
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

				-- list of language that will be disabled
				disable = { "markdown" },

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
