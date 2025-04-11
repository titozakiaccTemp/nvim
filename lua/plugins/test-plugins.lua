return {
	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		-- NOTE: calon pengganti telescope dari Teej
		"ibhagwan/fzf-lua",
		-- optional for icon support
		-- dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		-- NOTE : awalnya terasa slow saat buka app.tsx diproject lynx, tp saat dibanding dengan telescope ternyata sama saja
		-- NOTE : secara tampilan window lebih bagus ini
		keys = {
			{
				"<leader>ff",
				"<cmd>FzfLua files<cr>",
				desc = "FzfLua files",
			},
			-- 	-- { "<leader>fg", "<cmd>Telescope git_files<cr>" },
			-- 	{ "<leader>fg", "<cmd>Telescope live_grep<cr>" },
			-- 	{ "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope all references" },
			-- 	{
			-- 		"<leader>fs",
			-- 		"<cmd>Telescope lsp_document_symbols<cr>",
			-- 		desc = "Lists LSP document symbols in the current buffer",
			-- 	},
			-- 	{
			-- 		"<leader>fd",
			-- 		"<cmd>Telescope lsp_definitions<cr>",
			-- 		desc = "Goto the definition of the word under the cursor",
			-- 	},
			-- 	{
			-- 		"<leader>fx",
			-- 		"<cmd>Telescope diagnostics<cr>",
			-- 		desc = "Lists Diagnostics for all open buffers or a specific buffer",
			-- 	},
			--
			-- 	{ "<leader>muC", "<cmd>Telescope colorscheme<cr>", desc = "Lists Colorscheme" },
		},
		opts = {},
	},
}
