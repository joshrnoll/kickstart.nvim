return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    float = {
      max_width = 0.3,
    },
  },
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  lazy = false,
}
