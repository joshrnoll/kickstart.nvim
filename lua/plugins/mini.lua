return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }

    local starter = require 'mini.starter'
    starter.setup {
      header = [[
          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  //////////////////////////////////////////////////////////
          ⠀⠀⠀⠀⠀⠀⠀⠀⠀⡰⠊⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀  //                                                      //
          ⠀⠀⠀⠀⠀⠀⠀⠀⡰⠈⠀⠀⠠⠂⠂⠀⠀⢀⣀⠀⠀⠀⢀⣀⣴⢟⠛⠉  //  ░█▀▄░█▀█░░░░░░░█▀█░█▀▄░░░█▀▄░█▀█░░░█▀█░█▀█░▀█▀░░░   //
          ⠀⠀⠀⠀⠀⠀⠀⣾⣧⡠⣂⣤⣬⣲⣶⢷⣾⣛⠙⠳⠀⣤⣿⡿⠃⠂⠀⠀  //  ░█░█░█░█░░░░░░░█░█░█▀▄░░░█░█░█░█░░░█░█░█░█░░█░░░░   //
          ⣀⣀⣀⣀⣀⣀⡀⠛⢿⣷⠟⡋⣩⠻⣗⠀⠻⣝⢻⡌⠀⣍⡥⠊⠀⠀⠀⠀  //  ░▀▀░░▀▀▀░▄▀░░░░▀▀▀░▀░▀░░░▀▀░░▀▀▀░░░▀░▀░▀▀▀░░▀░░▀░   //
          ⠈⠑⢝⡻⠿⣿⣿⣿⣾⡟⠘⢋⡉⠞⠒⠒⠋⠈⢲⣿⣿⡛⠁⠀⠀⠀⠀⠀  //  ░▀█▀░█░█░█▀▀░█▀▄░█▀▀░░░▀█▀░█▀▀░░░█▀█░█▀█            //
          ⠀⠀⠀⠈⠑⠢⠍⠙⣿⣿⣄⡀⣠⣎⡀⠤⢤⣢⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀  //  ░░█░░█▀█░█▀▀░█▀▄░█▀▀░░░░█░░▀▀█░░░█░█░█░█            //
          ⠀⠀⠀⠀⠀⠀⠀⠀⠙⠙⣿⣿⣿⣿⣿⣿⣛⣿⣿⣿⡅⠀⠀⠀⠀⠀⠀⠀  //  ░░▀░░▀░▀░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀▀▀░░░▀░▀░▀▀▀            //
          ⠀⠀⠀⠀⠀⠀⠀⢀⣀⣴⣿⣿⣿⣿⣿⣿⣿⣿⢿⣫⢤⢙⢦⠰⣄⡀⠀⠀  //  ░▀█▀░█▀▄░█░█░░░                                     //
          ⠀⠀⠀⠀⠀⢠⣼⣿⣿⣿⣳⢻⣿⣿⣿⣿⣷⠾⠿⠋⠖⠄⠀⠙⠎⢷⡀⠀  //  ░░█░░█▀▄░░█░░░░                                     //
          ⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣯⡁⢿⣿⣿⣶⣶⣶⠶⠞⢉⣇⡀⠀⣀⣼⣷⠀  //  ░░▀░░▀░▀░░▀░░▀░                                     //
          ⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣧⡾⢉⡛⠿⠢⢌⢀⣾⣿⣿⣿⣿⣿⣿⠀  //                                                      //
          ⠀⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡦⡦⢮⠀⢰⡙⡛⠿⣿⣿⣿⠂  //////////////////////////////////////////////////////////
      ]],
      items = {
        starter.sections.recent_files(10, false),
        starter.sections.builtin_actions(),
        { name = 'Projects', action = 'Telescope projects', section = 'Telescope' },
      },
    }

    require('mini.diff').setup()
    vim.keymap.set('n', '<leader>gd', '<Cmd>lua MiniDiff.toggle_overlay()<CR>', { desc = '[G]it [D]iff' })

    require('mini.surround').setup()

    require('mini.comment').setup()

    require('mini.pairs').setup()

    require('mini.move').setup()

    local miniclue = require 'mini.clue'
    miniclue.setup {
      window = {
        delay = 0,
      },
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'v', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
    }

    local statusline = require 'mini.statusline'
    require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }

    -- Set the section for cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
