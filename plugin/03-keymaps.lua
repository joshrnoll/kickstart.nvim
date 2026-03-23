-- NOTE: Most keymaps are set in their respective plugin. See lua/plugins/{plugin}.lua
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Manipulate buffers
vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", { desc = "[B]uffer [D]elete" })

-- Control splits
vim.keymap.set("n", "<leader>wv", "<Cmd>vsplit<CR>, ", { desc = "[W]indow split [V]ertical" })
vim.keymap.set("n", "<leader>wh", "<Cmd>split<CR>, ", { desc = "[W]indow split [H]orizontal" })

-- Open infile
vim.keymap.set("n", "<leader>i", "<Cmd>edit $HOME/Documents/Obsidian/gtd/infile.md<CR>", { desc = "[I]nfile" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "yaml",
	callback = function()
		local opts = { buffer = true }
		vim.keymap.set(
			"n",
			"<leader>sy",
			"<cmd>YAMLTelescope<cr>",
			vim.tbl_extend("force", opts, { desc = "YAML Telescope" })
		)
		vim.keymap.set(
			"n",
			"<leader>vy",
			"<cmd>YAMLView<cr>",
			vim.tbl_extend("force", opts, { desc = "View current YAML path" })
		)
		vim.keymap.set(
			"n",
			"<leader>yy",
			"<cmd>YAMLYank<cr>",
			vim.tbl_extend("force", opts, { desc = "YAML Yank path and value" })
		)
		vim.keymap.set(
			"n",
			"<leader>yk",
			"<cmd>YAMLYankKey<cr>",
			vim.tbl_extend("force", opts, { desc = "YAML Yank key" })
		)
		vim.keymap.set(
			"n",
			"<leader>yv",
			"<cmd>YAMLYankValue<cr>",
			vim.tbl_extend("force", opts, { desc = "YAML Yank value" })
		)

		-- YAML Schema switching
		-- Reason: Sends workspace/didChangeConfiguration to yamlls to apply a schema to the current buffer
		vim.keymap.set("n", "<leader>ysk", function()
			SetYamlSchema("kubernetes")
		end, vim.tbl_extend("force", opts, { desc = "[Y]aml [S]chema [K]ubernetes" }))

		vim.keymap.set("n", "<leader>ysc", function()
			SetYamlSchema("https://json.schemastore.org/chart.json")
		end, vim.tbl_extend("force", opts, { desc = "[Y]aml [S]chema [C]hart" }))

		vim.keymap.set("n", "<leader>ysn", function()
			SetYamlSchema(nil)
		end, vim.tbl_extend("force", opts, { desc = "[Y]aml [S]chema [N]one" }))
	end,
})
