-- mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
return {
	"williamboman/mason-lspconfig.nvim",
	opts = function()
		require("mason-lspconfig").setup({
			ensure_installed = require("plugins.core.setup-sources").mason_lsps,
		})
	end,
}
