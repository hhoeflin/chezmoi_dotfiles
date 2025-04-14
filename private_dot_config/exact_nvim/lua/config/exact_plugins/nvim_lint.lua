return {
	"mfussenegger/nvim-lint",
	lazy = false,
	init = function()
		local linter_ft_table = {}
		if vim.env.NVIM_LINT_PYTHON then
			linter_ft_table["python"] = vim.split(vim.env.NVIM_LINT_PYTHON, ",")
		else
			linter_ft_table["python"] = { "ruff", "mypy" }
		end
		require("lint").linters_by_ft = linter_ft_table

		vim.cmd([[
        autocmd BufWritePost * exec ':silent! lua require("lint").try_lint()'
        ]])

		vim.cmd([[
        command LintAll :let buf=bufnr('%') | exec 'bufdo lua require("lint").try_lint()' | exec 'b' buf
        ]])

		vim.diagnostic.config({
			virtual_text = {
				source = "always",
				format = function(diagnostic)
					if diagnostic.user_data ~= nil then
						if diagnostic.user_data.lsp.code ~= nil then
							return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
						end
					end
					return diagnostic.message
				end,
			},
		})
	end,
}
