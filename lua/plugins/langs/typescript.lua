local setup_sources = require("plugins.core.setup-sources")

return {
  {
    -- Language Parser
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      vim.list_extend(setup_sources.language_parsers, { "typescript" })
    end,
  },
  {
    -- LSP
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      vim.list_extend(setup_sources.mason_lsps, { "vtsls" })

      -- setup client
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.vtsls.setup({ capabilities = capabilities })
    end,
  },
  {
    -- LS from tool
    "nvimtools/none-ls.nvim",
    opts = function()
      vim.list_extend(setup_sources.mason_general_packages, { "prettier" }) -- install through mason general packages

      vim.list_extend(setup_sources.null_ls_packages_setup, {
        require("null-ls").builtins.formatting.prettier
      })
    end
  }
}
