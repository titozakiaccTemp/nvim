local setup_sources = require("plugins.core.setup-sources")

return {
  {
    -- LSP
    "williamboman/mason-lspconfig.nvim",
    opts = function()
      vim.list_extend(setup_sources.mason_lsps, { "gopls" })

      -- Add Go tools to mason packages
      vim.list_extend(setup_sources.mason_general_packages, {
        "gofumpt",      -- Go formatter
        "golines",      -- Go line length formatter
        "gomodifytags", -- Go struct tag modifier
        "gotests",      -- Go test generator
        "impl",         -- Go interface implementer
        "staticcheck",  -- Go static analysis
        "golangci-lint", -- Go linter
      })

      -- setup client
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup({ 
        capabilities = capabilities,
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      })
    end,
  },
  {
    -- Go-specific plugin for better Go development
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        go = "C:\\Program Files\\Go\\bin\\go.exe", -- specify full path to go executable
        goimports = "gopls", -- use gopls for imports
        gofmt = "gofumpt",   -- use gofumpt for formatting
        max_line_len = 120,
        tag_transform = false,
        test_dir = "",
        comment_placeholder = "ﳑ  ",
        lsp_cfg = false, -- we handle LSP setup above
        lsp_gofumpt = true,
        lsp_on_attach = false,
        dap_debug = true,
        dap_debug_keymap = true,
        dap_debug_gui = true,
        dap_debug_vt = true,
        build_tags = "tag1,tag2",
        textobjects = true,
        test_runner = "go",
        verbose_tests = true,
        run_in_floaterm = false,
        trouble = true,
        test_efm = false,
        luasnip = true,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    -- Disable automatic build to avoid PATH issues
    -- build = ':lua require("go.install").update_all_sync()',
  },
}
