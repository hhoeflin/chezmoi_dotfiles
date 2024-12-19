-- Bootstrap lazy if not present
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load the configuration
require("settings")

if vim.loop.fs_stat(".nvim.lua") then
	vim.opt.exrc = true -- allow local .nvim.lua .vimrc .exrc files
else
	require("config")()
end
