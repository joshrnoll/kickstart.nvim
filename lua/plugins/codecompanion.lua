return {
	"olimorris/codecompanion.nvim",
	opts = {
		adapters = {
			acp = {
				claude_code = function()
					return require("codecompanion.adapters").extend("claude_code", {
						env = {
							CLAUDE_CODE_OAUTH_TOKEN = 'cmd:sops -d $HOME/.config/nvim/keys/claude.enc.txt | tr -d "\n"',
						},
					})
				end,
			},
			http = {
				openrouter = function()
					return require("codecompanion.adapters").extend("openai_compatible", {
						env = {
							url = "https://openrouter.ai/api",
							api_key = 'cmd:sops -d $HOME/.config/nvim/keys/openrouter.enc.txt | tr -d "\n"',
							chat_url = "/v1/chat/completions",
						},
						schema = {
							model = {
								default = "x-ai/grok-code-fast-1",
							},
						},
					})
				end,
				openai = function()
					return require("codecompanion.adapters").extend("openai_responses", {
						env = {
							api_key = 'cmd:sops -d $HOME/.config/nvim/keys/openai.enc.txt | tr -d "\n"',
						},
					})
				end,
			},
		},
		interactions = {
			chat = {
				adapter = "openai",
			},
			inline = {
				adapter = "openai",
			},
			cmd = {
				adapter = "openai",
			},
			background = {
				adapter = "openai",
			},
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>cc", "<Cmd>CodeCompanionChat<CR>", mode = "n", desc = "CodeCompanion Chat" },
		{ "<leader>cc", "<Cmd>CodeCompanion<CR>", mode = "v", desc = "CodeCompanion Inline Chat" },
	},
}
