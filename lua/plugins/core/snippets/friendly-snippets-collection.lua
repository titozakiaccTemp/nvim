return {
  "rafamadriz/friendly-snippets",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load() -- setting harus dilakukan disini jika diletakan di config lain, sering tidak bekerja
    -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
  end,
}
