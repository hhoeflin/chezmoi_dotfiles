local g = vim.g

-- Enable alignment
g.neoformat_basic_format_align = 1

-- Enable tab to spaces conversion
g.neoformat_basic_format_retab = 1

-- Enable trimmming of trailing whitespace
g.neoformat_basic_format_trim = 1

g.neoformat_enabled_python = {'black', 'isort', 'docformatter'}
g.neoformat_enabled_r = {'styler'}
g.neoformat_enabled_rust = {'rustfmt'}
g.neoformat_enabled_javascript = {'prettier'}
g.neoformat_enabled_css = {'prettier'}
g.neoformat_enabled_html = {'prettier'}
g.neoformat_enabled_haskell = {'ormolu'}

g.neoformat_run_all_formatters = 1
g.neoformat_only_msg_on_error = 1

vim.cmd [[
:augroup fmt
:  autocmd!
:  autocmd BufWritePre * undojoin | Neoformat
:augroup END
]]
