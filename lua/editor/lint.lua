return {

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			
			-- Configure linters by filetype (only linter names as strings)
			lint.linters_by_ft = {
				markdown = { "markdownlint" },
				yaml = { "yamllint" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
			}

			-- Customize markdownlint arguments
			lint.linters.markdownlint.args = {
				"--disable",
				"MD013", -- Line length
				"--disable",
				"MD044", -- Trailing punctuation in headers
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					-- Only run the linter in buffers that you can modify
					if vim.bo.modifiable then
						lint.try_lint()
					end
				end,
			})
		end,
	},
}
