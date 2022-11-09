--nvim-lint config
require('lint').linters_by_ft = {
  python = {'flake8', 'mypy', 'pydocstyle'}
}

vim.cmd [[
au BufWritePost lua require('lint').try_lint()
]]

vim.cmd [[
command LintAll :let buf=bufnr('%') | exec 'bufdo lua require("lint").try_lint()' | exec 'b' buf
]]
