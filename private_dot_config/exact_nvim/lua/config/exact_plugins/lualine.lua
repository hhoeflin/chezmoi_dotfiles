return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- require your component
		local spinner = require("myutils.code_companion_spinner")

		require("lualine").setup({
			sections = {
				lualine_c = {
					{
						"filename",
						file_status = true, -- displays file status (readonly status, modified status)
						path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
						shorting_target = 40, -- Shortens path to leave 40 space in the window
						-- for other components. Terrible name any suggestions?
					},
				},
				lualine_x = {
					{
						function()
							if vim.fn.exists("b:slime_config") ~= 0 then
								return "💩 " .. vim.b.slime_config["target_pane"]
							else
								return "💩 -"
							end
						end,
					},
					"encoding",
					"fileformat",
					"filetype",
					spinner,
				},
			},
		})
	end,
}
