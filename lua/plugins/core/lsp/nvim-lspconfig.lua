return {
  {
    "neovim/nvim-lspconfig",
    keys = {
      { "<leader>mlc", function() vim.cmd("checkhealth vim.lsp") end, desc = "check lsp",   mode = { "n" } },

      { "<leader>ca",  function() vim.lsp.buf.code_action() end, desc = "Code Action", mode = { "n" } },
    },
    config = function()
      --  format when save
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      -- lspconfig.lua_ls.setup({  })
    end,
  }
}
