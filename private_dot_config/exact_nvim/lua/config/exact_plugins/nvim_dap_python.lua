return {
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
      -- stylua: ignore
      keys = {
        { "<leader>dPt", function() require('dap-python').test_method() end, desc = "Debug Method" },
        { "<leader>dPc", function() require('dap-python').test_class() end, desc = "Debug Class" },
      },
			config = function()
				local python_path = "~/.local/progs/pipx/latest/venvs/debugpy/bin/python"
				require("dap-python").setup(python_path)
			end,
		},
	},
}
