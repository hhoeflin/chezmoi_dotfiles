return {
	"mrcjkb/rustaceanvim",
	version = "^5", -- Recommended
	lazy = false, -- This plugin is already lazy
	ft = "rust", -- Load on Rust filetype
	config = function()
		-- Set up buffer-local keymaps for Rust files
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "rust",
			callback = function(event)
				local bufnr = event.buf
				local opts = { buffer = bufnr, noremap = true, silent = true }

				-- Override K for Rust hover actions
				vim.keymap.set("n", "K", function()
					vim.cmd.RustLsp({ "hover", "actions" })
				end, vim.tbl_extend("force", opts, { desc = "Rust hover actions" }))

				-- Rust command keymaps
				vim.keymap.set("n", "<leader>rr", function()
					vim.cmd.RustLsp("runnables")
				end, vim.tbl_extend("force", opts, { desc = "Rust runnables" }))

				vim.keymap.set("n", "<leader>rd", function()
					vim.cmd.RustLsp("debuggables")
				end, vim.tbl_extend("force", opts, { desc = "Rust debuggables" }))

				vim.keymap.set("n", "<leader>rt", function()
					vim.cmd.RustLsp("testables")
				end, vim.tbl_extend("force", opts, { desc = "Rust testables" }))

				vim.keymap.set("n", "<leader>ra", function()
					vim.cmd.RustLsp("codeAction")
				end, vim.tbl_extend("force", opts, { desc = "Rust code actions (grouped)" }))

				vim.keymap.set("n", "<leader>re", function()
					vim.cmd.RustLsp("explainError")
				end, vim.tbl_extend("force", opts, { desc = "Rust explain error" }))

				vim.keymap.set("n", "<leader>rD", function()
					vim.cmd.RustLsp("renderDiagnostic")
				end, vim.tbl_extend("force", opts, { desc = "Rust render diagnostic" }))

				vim.keymap.set("n", "<leader>rc", function()
					vim.cmd.RustLsp("openCargo")
				end, vim.tbl_extend("force", opts, { desc = "Rust open Cargo.toml" }))

				vim.keymap.set("n", "<leader>ro", function()
					vim.cmd.RustLsp("openDocs")
				end, vim.tbl_extend("force", opts, { desc = "Rust open docs.rs" }))

				vim.keymap.set("n", "<leader>rp", function()
					vim.cmd.RustLsp("parentModule")
				end, vim.tbl_extend("force", opts, { desc = "Rust parent module" }))

				vim.keymap.set("n", "<leader>rj", function()
					vim.cmd.RustLsp("joinLines")
				end, vim.tbl_extend("force", opts, { desc = "Rust join lines" }))

				vim.keymap.set("v", "<leader>rj", function()
					vim.cmd.RustLsp("joinLines")
				end, vim.tbl_extend("force", opts, { desc = "Rust join lines" }))

				vim.keymap.set("n", "<leader>rm", function()
					vim.cmd.RustLsp("expandMacro")
				end, vim.tbl_extend("force", opts, { desc = "Rust expand macro" }))

				vim.keymap.set("n", "<leader>rP", function()
					vim.cmd.RustLsp("rebuildProcMacros")
				end, vim.tbl_extend("force", opts, { desc = "Rust rebuild proc macros" }))

				vim.keymap.set("n", "<leader>rmu", function()
					vim.cmd.RustLsp({ "moveItem", "up" })
				end, vim.tbl_extend("force", opts, { desc = "Rust move item up" }))

				vim.keymap.set("n", "<leader>rmd", function()
					vim.cmd.RustLsp({ "moveItem", "down" })
				end, vim.tbl_extend("force", opts, { desc = "Rust move item down" }))

				vim.keymap.set("n", "<leader>rh", function()
					vim.cmd.RustLsp({ "view", "hir" })
				end, vim.tbl_extend("force", opts, { desc = "Rust view HIR" }))

				vim.keymap.set("n", "<leader>rM", function()
					vim.cmd.RustLsp({ "view", "mir" })
				end, vim.tbl_extend("force", opts, { desc = "Rust view MIR" }))

				vim.keymap.set("n", "<leader>rs", function()
					vim.cmd.RustLsp("workspaceSymbol")
				end, vim.tbl_extend("force", opts, { desc = "Rust workspace symbols" }))

				-- Register which-key group for <leader>r
				local ok, wk = pcall(require, "which-key")
				if ok then
					wk.add({
						{ "<leader>r", group = "Rust", buffer = bufnr },
						{ "<leader>rm", group = "Rust move", buffer = bufnr },
					})
				end
			end,
		})
	end,
}
