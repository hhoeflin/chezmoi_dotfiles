local function nvim_tree_on_attach(bufnr)
	local gitpath = require("myutils.gitpath")
	local api = require("nvim-tree.api")
	local luv = vim.loop

	local function is_already_added(item_path, chat)
		for _, ref in ipairs(chat.refs) do
			if ref.path == item_path then
				return true
			end
		end
		return false
	end
	-- Function to recursively add files in a directory to chat references
	local function traverse_directory(path, chat)
		local handle, err = luv.fs_scandir(path)
		if not handle then
			return print("Error scanning directory: " .. err)
		end

		while true do
			local name, type = luv.fs_scandir_next(handle)
			if not name then
				break
			end

			local item_path = path .. "/" .. name
			if type == "file" then
				-- check if the file is tracked by git
				if gitpath.is_tracked(item_path) then
					-- if already added, ignore
					if not is_already_added(item_path, chat) then
						-- add the file to references
						chat.references:add({
							id = "<file>" .. item_path .. "</file>",
							path = item_path,
							source = "codecompanion.strategies.chat.slash_commands.file",
							opts = {
								pinned = true,
							},
						})
					end
				else
					print("Skipping untracked file: " .. item_path)
				end
			elseif type == "directory" then
				-- recursive call for a subdirectory
				traverse_directory(item_path, chat)
			end
		end
	end

	-- Attach default mappings
	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "ca", function()
		local node = api.tree.get_node_under_cursor()
		local path = node.absolute_path
		local codecompanion = require("codecompanion")
		local chat = codecompanion.last_chat()
		-- create chat if none exists
		if chat == nil then
			chat = codecompanion.chat()
		end

		local attr = luv.fs_stat(path)
		if attr and attr.type == "directory" then
			-- Recursively traverse the directory
			traverse_directory(path, chat)
		else
			-- if already added, ignore
			for _, ref in ipairs(chat.refs) do
				if ref.path == path then
					return print("Already added")
				end
			end
			chat.references:add({
				id = "<file>" .. path .. "</file>",
				path = path,
				source = "codecompanion.strategies.chat.slash_commands.file",
				opts = {
					pinned = true,
				},
			})
		end
	end, { buffer = bufnr, desc = "Add or Pin file to Chat" })
end

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
	keys = {
		{ "<C-p>", ":NvimTreeToggle <CR>", noremap = true },
	},
	opts = {
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		renderer = {
			root_folder_modifier = ":t",
		},
		on_attach = nvim_tree_on_attach,
	},
}
