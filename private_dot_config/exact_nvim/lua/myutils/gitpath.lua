local Path = require("plenary.path")

local M = {}

-- Returns the Git root for a given path (or nil if not in a repo)
function M.get_git_root(path)
	path = path or vim.loop.cwd()
	-- ensure path is a directory
	local dir = Path:new(path)
	if not dir:is_dir() then
		-- set dir to parent directory
		dir = Path:new(path):parent()
	end
	local result = vim.fn.systemlist({ "git", "-C", dir:absolute(), "rev-parse", "--show-toplevel" })
	if vim.v.shell_error ~= 0 then
		return nil
	end
	return result[1]
end

-- Checks if a file is tracked (checked into Git)
function M.is_tracked(filepath)
	local abs_path = Path:new(filepath)
	local git_root = M.get_git_root(abs_path)

	if not git_root then
		print("Not in a Git repository")

		return false
	end

	-- Make the path relative to the Git root (required by git ls-files)
	local rel_path = Path:new(abs_path:absolute()):make_relative(git_root)

	local _ = vim.fn.system({
		"git",
		"-C",
		git_root,
		"ls-files",
		"--error-unmatch",
		rel_path,
	})

	return vim.v.shell_error == 0
end

return M
