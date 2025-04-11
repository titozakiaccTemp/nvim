local setup_sources = require("plugins.core.setup-sources")

return {
	{
		-- NullLS/None-LS
		"jay-babu/mason-null-ls.nvim",
		opts = function()
			vim.list_extend(setup_sources.null_ls_packages, { "prettier" })
		end,
	},
	{
		-- Language Parser
		"nvim-treesitter/nvim-treesitter",
		opts = function()
			vim.list_extend(setup_sources.language_parsers, { "svelte" })
		end,
	},
	{
		-- LSP
		"williamboman/mason-lspconfig.nvim",
		opts = function()
			vim.list_extend(setup_sources.mason_lsps, { "svelte" })

			-- setup client
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.svelte.setup({ capabilities = capabilities })
		end,
	},
}
