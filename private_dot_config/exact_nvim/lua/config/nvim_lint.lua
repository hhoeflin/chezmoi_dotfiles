--nvim-lint config
require('lint').linters_by_ft = {
  python = {'flake8', 'mypy'}
}

vim.cmd [[
autocmd BufWritePost * lua require('lint').try_lint()
]]

vim.cmd [[
command LintAll :let buf=bufnr('%') | exec 'bufdo lua require("lint").try_lint()' | exec 'b' buf
]]

vim.diagnostic.config({
virtual_text = {
    source = "always",
    format = function(diagnostic)
    if diagnostic.user_data.lsp.code ~= nil then
        return string.format("%s: %s", diagnostic.user_data.lsp.code, diagnostic.message)
    end
    return diagnostic.message
end,
},
})
