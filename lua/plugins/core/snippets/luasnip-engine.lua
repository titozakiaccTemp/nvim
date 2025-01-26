-- source for : comp doesn't ship with a snippets sort of execution engine,
-- luasnip is just code generating the snippets for you.
--
-- Fungsi Utama: Snippet Engine

--    Definisi: LuaSnip adalah snippet manager atau engine, yaitu plugin yang bertugas mendefinisikan, mengelola, dan memicu snippets.
--    Kemampuan:
--        - Menulis dan memicu snippet secara fleksibel.
--        - Mendukung snippets yang kompleks, seperti snippet bersarang, snippet dinamis (dynamic), dan snippet kondisional.
--        - Menyediakan API untuk membuat snippet custom dengan logika Lua.
--    Integrasi:
--        Mendukung berbagai source/collection snippets, seperti:
--            - Snippets dari friendly-snippets.
--            - Snippets yang Anda tulis sendiri.

-- seperti completion engine, snippet engine hanyalah engine, ia tidak memiliki source atau collection
-- kita memerlukan collection untuk snippet engine ini seperti LSP atau yang lainnya

return {
	"L3MON4D3/LuaSnip",
}

-- snippet adalah
-- dari tulis berikut :
-- fun
-- expand menjadi berikut :
-- function name() {}
-- snippet juga membuat kita bisa "lompat" dari menulis name langsung lompat ke menulis parameter dan lompat lagi menulis return value, tanpa harus menggeser mouse atau cursor secara manual
