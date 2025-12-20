return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    'BufReadPre '
      .. vim.fn.expand '~'
      .. '/Documents/Obsidian/*.md',
    'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Obsidian/*.md',
  },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
    'nvim-telescope/telescope.nvim',
    'nvim-treesitter',
  },
  opts = {
    -- Disable UI because markview is installed and conflicts.
    -- I tried adding the recommended option in after/ftplugin/markdown.lua but it didn't work
    -- (I think because markview does something similar already)
    -- https://github.com/epwalsh/obsidian.nvim/issues/286
    ui = {
      enable = false,
    },
    workspaces = {
      {
        name = 'gtd',
        path = '~/Documents/Obsidian/gtd/',
        overrides = {
          notes_subdir = 'In-Tray',
          templates = {
            folder = 'Templates',
            date_format = '%Y-%m-%d',
            time_format = '%H:%M:%S-0:400',
          },
        },
      },
      {
        name = 'para',
        path = '~/Documents/Obsidian/para/',
        overrides = {
          notes_subdir = '1-Inbox',
          templates = {
            folder = '3-areas/Templates',
            date_format = '%Y-%m-%d',
            time_format = '%H:%M:%S-0:400',
          },
        },
      },
      {
        name = 'zettelkasten',
        path = '~/Documents/Obsidian/zettelkasten/',
        overrides = {
          new_notes_location = 'current_dir',
        },
      },
    },
    picker = {
      name = 'telescope.nvim',
      note_mappings = {
        new = '<C-x>',
        insert_link = '<C-y>',
      },
      tag_mappings = {
        new = '<C-x>',
        insert_tag = '<C-y>',
      },
    },
    new_notes_location = 'notes_subdir',
    completion = {
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
  },
  keys = {
    { '<leader>on', '<Cmd>ObsidianNew<CR>', 'n', desc = '[O]bsidian [N]ew' },
    { '<leader>ot', '<Cmd>ObsidianNewFromTemplate<CR>', 'n', desc = '[O]bsidian new from [T]emplate' },
    { '<leader>os', '<Cmd>ObsidianSearch<CR>', 'n', desc = '[O]bsidian [S]earch' },
    { '<leader>of', '<Cmd>ObsidianFollowLink<CR>', 'n', desc = '[O]bsidian [F]ollow link' },
    { '<leader>olq', '<Cmd>ObsidianLink<CR>', 'v', desc = '[O]bsidian [L]ink [Q]uery - Query for selection, link to matching note' },
    { '<leader>oln', '<Cmd>ObsidianLinkNew<CR>', 'v', desc = '[O]bsidia [L]ink [N]ew - Create a new note and link to it' },
  },
}
