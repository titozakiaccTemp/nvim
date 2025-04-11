return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = function()
		local languageParsers = require("plugins.core.setup-sources").language_parsers

		require("nvim-treesitter.configs").setup({
			-- auto_install = true, -- Automatically install missing parsers when entering buffer. Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },

			sync_install = true, -- Install parsers synchronously (only applied to `ensure_installed`)
			ensure_installed = languageParsers, -- Ensure that Treesitter language parsers from 'langs' are installed
		})
	end,
}
