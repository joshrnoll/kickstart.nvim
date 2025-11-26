-- For `plugins/markview.lua` users.
return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  opts = {
    html = {
      enable = true,
    },
  },
  dependencies = { 'saghen/blink.cmp' },
}
