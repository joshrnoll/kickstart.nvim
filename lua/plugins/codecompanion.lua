return {
  'olimorris/codecompanion.nvim',
  opts = {
    disabled_adapters = { 'copilot' },
    strategies = {
      chat = {
        adapter = 'ollama',
        model = 'gpt-oss:120b-cloud',
      },
      inline = {
        adapter = 'ollama',
        model = 'gpt-oss:120b-cloud',
      },
    },
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
