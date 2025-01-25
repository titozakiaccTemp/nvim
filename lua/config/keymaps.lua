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
end, { desc = "Code Action" })

-- "williamboman/mason.nvim",
vim.keymap.set("n", "<leader>mlm", function()
  vim.cmd("Mason")
end, { desc = "Open Mason" })
