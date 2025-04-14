return {
	"sbdchd/neoformat",
	lazy = false,
	init = function()
		local g = vim.g

		-- ruff isort formatter
		g.neoformat_python_ruffisort = { exe = "ruff", args = { "check", "--select I", "--fix", "-q", "-"}, stdin = 1 }

		-- Enable alignment
		--g.neoformat_basic_format_align = 1

		-- Enable tab to spaces conversion
		g.neoformat_basic_format_retab = 1

		-- Enable trimmming of trailing whitespace
		g.neoformat_basic_format_trim = 1

		if vim.env.NVIM_FORMAT_PYTHON then
			g.neoformat_enabled_python = vim.split(vim.env.NVIM_FORMAT_PYTHON, ",")
		else
			g.neoformat_enabled_python = { "ruff", "ruffisort" }
		end
		g.neoformat_enabled_r = { "styler" }
		g.neoformat_enabled_rust = { "rustfmt" }
		g.neoformat_enabled_javascript = { "prettier" }
		g.neoformat_enabled_css = { "prettier" }
		g.neoformat_enabled_html = { "prettier" }
		g.neoformat_enabled_markdown = { "prettier" }
		g.neoformat_enabled_haskell = { "ormolu" }
		g.neoformat_enabled_purescript = { "purty" }
		g.neoformat_enabled_lua = { "stylua" }

		g.neoformat_run_all_formatters = 1
		g.neoformat_only_msg_on_error = 1

		vim.cmd([[
        :augroup fmt
        :  autocmd!
        :  au BufWritePre * try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry
        :augroup END
        ]])
	end,
}
