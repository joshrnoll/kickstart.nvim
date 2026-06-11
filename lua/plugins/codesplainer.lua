return {
  url = "https://github.com/joshrnoll/codesplainer",
  name = "codesplainer.nvim",
  lazy = true,
  cmd = { "CodesplainerAsk", "CodesplainerShow", "CodesplainerHide", "CodesplainerClear", "Codesplainer" },
  keys = {
    {
      "<leader>la",
      ":CodesplainerAsk ",
      mode = "v",
      desc = "Ask Codesplainer about selection",
    },
    {
      "<leader>ls",
      "<Cmd>CodesplainerShow<CR>",
      mode = "n",
      desc = "Show Codesplainer",
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
