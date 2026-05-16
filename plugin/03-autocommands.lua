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
local function find_project_root(path)
	if path == "" then
		return nil
	end
	local markers = { ".git", ".obsidian" }
	local dir = vim.fs.dirname(path)
	return vim.fs.root(dir, markers)
end

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function(args)
		if vim.bo[args.buf].filetype ~= "oil" then
			local root = find_project_root(vim.api.nvim_buf_get_name(args.buf))
			if root then
				vim.g.last_project_root = root
				vim.cmd("cd " .. vim.fn.fnameescape(root))
			end
		end
	end,
})

-- Change nvim directory on oil buffers
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "oil://*",
	callback = function()
		if vim.g.last_project_root then
			vim.cmd("lcd " .. vim.fn.fnameescape(vim.g.last_project_root))
		else
			vim.cmd("lcd " .. vim.fn.fnameescape(require("oil").get_current_dir()))
		end
	end,
})
