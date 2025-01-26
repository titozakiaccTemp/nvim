-- setup `mapleader` and `maplocalleader` before lazyvim
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>t", vim.cmd.Ex)

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>cs", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<leader>c/", function()
	vim.cmd("normal gcc")
end, { desc = "Comment" })

-- WINDOW
vim.keymap.set("n", "<leader>uv", function()
	vim.cmd("vsplit")
end, { desc = "Split window left" })

vim.keymap.set("n", "<leader>uh", function()
	vim.cmd("split")
end, { desc = "Split window bellow" })

vim.keymap.set("n", "<leader>ud", function()
	vim.cmd("close")
end, { desc = "Delete window" })

vim.keymap.set("n", "<leader>w", "<c-w>", { desc = "Move to next window" })

-- vim.keymap.set("n", "<leader>u+", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
-- vim.keymap.set("n", "<leader>u-", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<leader>uj", "<cmd>vertical resize -50<cr>", { desc = "Decrease window width by 50col" })
vim.keymap.set("n", "<leader>uk", "<cmd>vertical resize +50<cr>", { desc = "Increase window width by 50col" })
vim.keymap.set("n", "<leader>un", "<cmd>wincmd =<cr>", { desc = "Reset window width to normal" })

-- vim.keymap.set(
--   "n",
--   "<leader>sx",
--   require("telescope.builtin").resume,
--   { noremap = true, silent = true, desc = "resume" }
-- )

--

-- "neovim/nvim-lspconfig",
vim.keymap.set("n", "<leader>mlc", function()
	vim.cmd("checkhealth vim.lsp")
end, { desc = "Check LSP health" })

vim.keymap.set("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Code action" })

-- "williamboman/mason.nvim",
vim.keymap.set("n", "<leader>mlm", function()
	vim.cmd("Mason")
end, { desc = "Open mason" })

-- "nvimtools/none-ls",
vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "none-ls format" })

-- SAVE FOR LATER

-- Move Lines
-- map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
-- map("n", "<a-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "move up" })
-- map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move down" })
-- map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move up" })
-- map("v", "<a-j>", ":<c-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "move down" })
-- map("v", "<a-k>", ":<c-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "move up" })
