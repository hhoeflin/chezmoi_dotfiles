return function(extraspec)
	local spec = { { import = "config.plugins" } }
	spec = extraspec and vim.list_extend(spec, extraspec) or spec
	require("settings")
	require("lazy").setup(spec, {
		-- more code...
	})
end
