return {
	"ahmedkhalf/project.nvim",
	config = function()
		require("project_nvim").setup({
			patterns = { ">github", ">gitea", ">gitlab", ".git", ".obsidian" },
			show_hidden = true,
			silent_chdir = false,
		})
		vim.keymap.set("n", "<leader>sp", "<Cmd>Telescope projects<CR>", { desc = "[S]earch [P]rojects" })
	end,
}
