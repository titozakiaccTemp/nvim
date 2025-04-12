return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = require("plugins.core.setup-sources").null_ls_packages_setup,
    })
  end
}
