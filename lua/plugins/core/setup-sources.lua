local M = {}

-- for treesitter parser
M.language_parsers = {
	-- list lang parsers : https://github.com/nvim-treesitter/nvim-treesitter/tree/master?tab=readme-ov-file#supported-languages
	-- "svelte"
}

-- for lsp installed from mason
M.mason_lsps = {
	-- source :  https://mason-registry.dev/registry/list
	-- atau lihat saja dari :Mason, contoh => (v) rust-analyzer rust_analyzer, rust_analyzer (keywords: rust) -- yang ditulis adalah rust_analyzer (yg ditulis adalah nama packagenya, atau jika ada nama setelah package tersebut, atau apapun sebelum tanda kurung dari keyword)
	"lua_ls",
	"rust_analyzer",
	-- TODO: Typescript ls, vtls
}

-- for mason to null ls
M.null_ls_packages = {
	-- Opt to list sources here, when available in mason.
	-- Note: this plugin uses the null-ls source names in the APIs it exposes - not mason.nvim package names.
	-- list package yang bisa diinstall : https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md
	"stylua",
}

return M
