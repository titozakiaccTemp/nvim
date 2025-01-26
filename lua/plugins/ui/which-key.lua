return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		icons = {
			separator = ":",
			mappings = false, -- disable icons
		},
		spec = {
			{
				{ "<leader>t", group = "NETRW" },
				{ "<leader>u", group = "Window options" },

				{ "<leader>c", group = "Code" },
				{ "<leader>cs", group = "Rename all every same word like in under cursor" },
				{ "<leader>cx", group = "Make current buffer executable" },

				{ "<leader>y", group = "Yank options" },
				{ "<leader>Y", group = "Yank to system clipboard" },

				{ "<leader>m", group = "Miscellaneous" },
				{ "<leader>ml", group = "LSP things" },
				{ "<leader>mu", group = "UI things" },

				{ "<leader>f", group = "Telescope" },
				{ "<leader>s", group = "Search" },
			},
			{
				mode = { "v" },
				{ "<leader>y", group = "Yank to system clipboard" },
				{ "<leader>c", group = "Code" },
				{ "<leader>u", group = "Screenshot" },
			},
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
