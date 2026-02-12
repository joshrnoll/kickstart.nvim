-- NOTE: Most keymaps are set in their respective plugin. See lua/plugins/{plugin}.lua
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Manipulate buffers
vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>", { desc = "[B]uffer [D]elete" })

-- Control splits
vim.keymap.set("n", "<leader>wv", "<Cmd>vsplit<CR>, ", { desc = "[W]indow split [V]ertical" })
vim.keymap.set("n", "<leader>wh", "<Cmd>split<CR>, ", { desc = "[W]indow split [H]orizontal" })

-- Open infile
vim.keymap.set("n", "<leader>i", "<Cmd>edit $HOME/Documents/Obsidian/gtd/infile.md<CR>", { desc = "[I]nfile" })
