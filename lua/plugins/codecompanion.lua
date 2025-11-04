return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'ollama',
        model = 'gpt-oss:20b-cloud',
      },
    },
    -- NOTE: The log_level is in `opts.opts`
    opts = {
      log_level = 'DEBUG',
    },
  },
}
