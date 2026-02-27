--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Cache last project root directory on every buffer enter
vim.g.last_project_root = nil
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		if vim.bo.filetype ~= "oil" then
			local ok, root = pcall(require("project_nvim.project").get_project_root)
			if ok and root then
				vim.g.last_project_root = root
			end
		end
	end,
})

-- Change nvim directory on oil buffers
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "oil://*",
	callback = function()
		if vim.g.last_project_root then
			vim.cmd("lcd " .. vim.g.last_project_root)
		else
			vim.cmd("lcd " .. require("oil").get_current_dir())
		end
	end,
})
