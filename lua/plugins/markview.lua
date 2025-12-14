-- For `plugins/markview.lua` users.
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  opts = {
    html = {
      enable = true,
    },
    preview = {
      filetypes = { 'markdown', 'codecompanion' },
      ignore_buftypes = {},
    },
  },
  dependencies = { 'saghen/blink.cmp' },
}
