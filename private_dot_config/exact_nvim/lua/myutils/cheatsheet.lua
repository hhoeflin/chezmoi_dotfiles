local M = {}

local win = nil

function M.toggle()
	-- Close if already open
	if win and vim.api.nvim_win_is_valid(win) then
		vim.api.nvim_win_close(win, true)
		win = nil
		return
	end

	local path = vim.fn.stdpath("config") .. "/cheatsheet.md"

	local ui = vim.api.nvim_list_uis()[1]
	local width = math.floor(ui.width * 0.90)
	local height = math.floor(ui.height * 0.90)
	local row = math.floor((ui.height - height) / 2)
	local col = math.floor((ui.width - width) / 2)

	local buf = vim.api.nvim_create_buf(false, true)

	win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
		title = " Cheatsheet ",
		title_pos = "center",
	})

	-- Run glow inside the terminal buffer so it gets a real PTY: correct
	-- dimensions, full ANSI colour, and its built-in pager for scrolling.
	-- Pressing 'q' in glow exits it and the on_exit callback closes the float.
	vim.fn.termopen({ "glow", "-w", tostring(width - 4), path }, {
		on_exit = function()
			vim.schedule(function()
				if win and vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end
				win = nil
			end)
		end,
	})

	vim.cmd("startinsert")
end

return M
