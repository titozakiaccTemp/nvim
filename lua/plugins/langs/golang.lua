local setup_sources = require("plugins.core.setup-sources")

return {
  {
    -- LSP
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      vim.list_extend(setup_sources.mason_lsps, { "gopls" })

      -- setup client
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup({ capabilities = capabilities })
    end,
  },
}
