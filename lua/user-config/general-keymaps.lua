-- vim.keymap.set("n", "<leader>mce", "<cmd>exe 'edit' stdpath('config').'/lua/plugins/test-plugins.lua'<cr>", { desc = "plugin/extras testing testing" })

-- Escape mappings for jj and jk
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })
vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })

-- Terminal mode escape mappings
vim.keymap.set("t", "jj", "<C-\\><C-n>", { desc = "Exit terminal mode with jj" })
vim.keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode with jk" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode with Esc" })
