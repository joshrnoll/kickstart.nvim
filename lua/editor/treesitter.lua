return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup({})

		-- Parsers bundled with Neovim 0.12: c, lua, markdown, query, vim, vimdoc
		-- Install additional parsers (async, no-op if already installed)
		require("nvim-treesitter").install({
			"bash",
			"yaml",
			"python",
			"diff",
			"html",
			"luadoc",
			"markdown_inline",
			"javascript",
			"typescript",
			"tsx",
		})
	end,
}
