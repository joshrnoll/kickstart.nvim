--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- netrw - File explorer
vim.keymap.set('n', '<leader>ee', '<Cmd>Explore<CR>', { desc = '[E]xplore' })
vim.keymap.set('n', '<leader>ev', '<Cmd>Vexplore<CR>', { desc = '[V[E]xplore' })

-- Manipulate buffers
vim.keymap.set('n', '<leader>bd', '<Cmd>bd<CR>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>q', '<Cmd>q<CR>', { desc = 'Quit' })

-- Obsidian Plugin
vim.keymap.set('n', '<leader>on', '<Cmd>ObsidianNew<CR>', { desc = '[O]bsidian [N]ew' })
vim.keymap.set('n', '<leader>ot', '<Cmd>ObsidianNewFromTemplate<CR>', { desc = '[O]bsidian new from [T]emplate' })
vim.keymap.set('n', '<leader>os', '<Cmd>ObsidianSearch<CR>', { desc = '[O]bsidian [S]earch' })
vim.keymap.set('n', '<leader>of', '<Cmd>ObsidianFollowLink<CR>', { desc = '[O]bsidian [F]ollow link' })
vim.keymap.set('v', '<leader>olq', '<Cmd>ObsidianLink<CR>', { desc = '[O]bsidian [L]ink [Q]uery - Query for selection, link to matching note' })
vim.keymap.set('v', '<leader>oln', '<Cmd>ObsidianLinkNew<CR>', { desc = '[O]bsidian [L]ink [N]ew - Create a new note and link to it' })
