return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "moon",
			integrations = { blink_cmp = true },
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			-- flavour = "latte",
			flavour = "macchiato",
			color_overrides = {
				macchiato = {
					overlay2 = "#9399b2",
					overlay1 = "#7f849c",
					overlay0 = "#6c7086",
					surface2 = "#585b70",
					surface1 = "#45475a",
					-- surface0 = "#313244", -- ori
					surface0 = "#272735", -- bit darker
					base = "#1e1e2e",
					mantle = "#181825",
					crust = "#11111b",
				},
				latte = {
					green = "#439d2f",
				},
			},
			-- ref : catppuccin/nvim/lua/catppuccin/palettes/latte.lua
		},
	},
}
