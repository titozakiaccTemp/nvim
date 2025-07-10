return {
	{
		"okuuva/auto-save.nvim",
		version = "^1.0.0", -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		opts = {
			-- your config goes here
			-- or just leave it empty :)
			debounce_delay = 0,
		},
	},
	-- Terminal plugin
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{ "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
			{ "<leader>tt", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Toggle floating terminal" },
			{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Toggle horizontal terminal" },
			{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Toggle vertical terminal" },
		},
		opts = {
			size = 20,
			open_mapping = [[<c-\\>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "float",
			close_on_exit = true,
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				winblend = 0,
				highlights = {
					border = "Normal",
					background = "Normal",
				},
			},
		},
	},
	-- Auto-pairs for general auto-closing
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			check_ts = true,
			ts_config = {
				lua = { "string", "source" },
				javascript = { "string", "template_string" },
				java = false,
			},
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			fast_wrap = {
				map = "<M-e>",
				chars = { "{", "[", "(", '"', "'" },
				pattern = "([%'%\"%>%]%)%}%,])",
				offset = 0,
				end_key = "$",
				keys = "qwertyuiopzxcvbnmasdfghjkl",
				check_comma = true,
				highlight = "PmenuSel",
				highlight_grey = "LineNr",
			},
		},
	},
	-- Auto-closing tags for HTML/JSX/TSX
	{
		"windwp/nvim-ts-autotag",
		event = "InsertEnter",
		opts = {
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Also override individual filetype configs, these take priority.
			-- Empty by default, useful if one of the "opts" global settings
			-- doesn't work well in a specific filetype
			per_filetype = {
				["html"] = {
					enable_close = false,
				},
			},
		},
	},
	{
		"mbbill/undotree",
		keys = { -- load the plugin only when using it's keybinding:
			{ "<leader>z", vim.cmd.UndotreeToggle, desc = "Toggle undo tree" },
		},
		config = function() end,
	},
	-- {
	--   "sphamba/smear-cursor.nvim",
	--   opts = function() end,
	-- },
}
