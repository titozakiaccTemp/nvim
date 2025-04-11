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
