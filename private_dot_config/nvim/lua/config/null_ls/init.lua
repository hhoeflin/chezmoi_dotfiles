local parents = (...):match "(.-)[^%.]+$"
local logger = require("null-ls.logger")
local null_ls = require("null-ls")

--[[ ok, flakeheaven = require(parents .. "flakeheaven")

if not ok then
    logger:warn(
        string.format("failed to load builtin %s for method %s; please check your config", k, method)
    )
    return
end
]]

-- register any number of sources simultaneously
local sources = {
    -- flakeheaven,
    -- null_ls.builtins.diagnostics.pyproject_flake8,
    null_ls.builtins.diagnostics.pydocstyle,
    null_ls.builtins.diagnostics.mypy,
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.isort,
}

null_ls.setup({ sources = sources })
