return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    float = {
      max_width = 0.3,
    },
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { '<leader>e', '<Cmd>Oil<CR>', 'n', desc = '[E]xplore' },
  },
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  lazy = false,
}
