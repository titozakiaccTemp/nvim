return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	-- event = 'VimEnter', -- Sets the loading event to 'VimEnter'
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		delay = 0,
		icons = {
			separator = ":",
			mappings = false, -- disable icons
			keys = {
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				C = "<C-…> ",
				M = "<M-…> ",
				D = "<D-…> ",
				S = "<S-…> ",
				CR = "<CR> ",
				Esc = "<Esc> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				NL = "<NL> ",
				-- BS = '<BS> ',
				BS = "<Backspace> ",
				-- Space = '<Space> ',
				Space = "",
				Tab = "<Tab> ",
				F1 = "<F1>",
				F2 = "<F2>",
				F3 = "<F3>",
				F4 = "<F4>",
				F5 = "<F5>",
				F6 = "<F6>",
				F7 = "<F7>",
				F8 = "<F8>",
				F9 = "<F9>",
				F10 = "<F10>",
				F11 = "<F11>",
				F12 = "<F12>",
			},
		},
		spec = {
			{
				{ "<leader>t", group = "NETRW" },
				{ "<leader>u", group = "Window options" },

				{ "<leader>c", group = "Code" },
				{ "<leader>cs", group = "Rename all every same word like in under cursor" },
				{ "<leader>cx", group = "Make current buffer executable" },
				{ "<leader>cp", group = "Format" },

				{ "<leader>y", group = "Yank options" },
				{ "<leader>Y", group = "Yank to system clipboard" },

				{ "<leader>m", group = "Miscellaneous" },
				{ "<leader>ml", group = "LSP things" },
				{ "<leader>mu", group = "UI things" },
				{ "<leader>mc", group = "Neovim Config" },

				{ "<leader>f", group = "Telescope" },
				{ "<leader>s", group = "Search" },
				{ "<leader>x", group = "Fix list" },
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
