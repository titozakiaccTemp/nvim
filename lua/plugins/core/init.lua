local ss = require("plugins.core.setup-sources")

ss.language_parsers = ss.dedupe_list(ss.language_parsers)
ss.mason_lsps = ss.dedupe_list(ss.mason_lsps)
ss.mason_general_packages= ss.dedupe_list(ss.mason_general_packages)
ss.null_ls_packages_setup = ss.dedupe_list(ss.null_ls_packages_setup)

return {
  require("plugins.core.treesitter"),

  require("plugins.core.lsp"),
  require("plugins.core.autocompletion"),
  require("plugins.core.snippets"),

  -- require("plugins.core.completion"),
}
