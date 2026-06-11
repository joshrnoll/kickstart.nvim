return {
	url = "https://github.com/joshrnoll/codesplainer",
	name = "codesplainer.nvim",
	lazy = true,
	cmd = { "CodesplainerAsk", "CodesplainerClear", "Codesplainer" },
	keys = {
		{
			"<leader>ca",
			"<Cmd>CodesplainerAsk<CR>",
			mode = "v",
			desc = "Ask Codesplainer about selection",
		},
		{
			"<leader>cs",
			"<Cmd>Codesplainer<CR>",
			mode = "n",
			desc = "Toggle Codesplainer",
		},
	},
	opts = {
		provider = "openai",
		openai = {
			api_key_env = "OPENROUTER_API_KEY",
			endpoint = "https://openrouter.ai/api/v1/chat/completions",
			model = "google/gemini-3.1-flash-lite",
		},
	},
}
