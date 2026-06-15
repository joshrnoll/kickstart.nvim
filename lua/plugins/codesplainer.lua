return {
	url = "https://github.com/joshrnoll/codesplainer",
	cmd = { "CodesplainerAsk", "CodesplainerClear", "CodesplainerCodexLogin", "Codesplainer" },
	keys = {
		{
			"<leader>ca",
			":'<,'>CodesplainerAsk<CR>",
			mode = "v",
			desc = "Ask Codesplainer about selection",
		},
		{
			"<leader>ct",
			"<Cmd>Codesplainer<CR>",
			mode = "n",
			desc = "Toggle Codesplainer",
		},
	},
	opts = {
		provider = "codex",
	},
}
