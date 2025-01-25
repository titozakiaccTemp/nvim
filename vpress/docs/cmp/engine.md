# Autocompletion Engine
Autocompletion engine adalah core dari sistem autocompletion pada neovim. Autocompletion engine bertugas memberikan daftar saran saat mengetik.
Pada Neovim ada beberapa plugin Autocompletion engine, contoh yang populer dan banyak digunakan adalah plugin `hrsh7th/nvim-cmp` dan plugin yang cukup bagus dan simple untuk disetup adalah plugin `saghen/blink.cmp`.

Disini saya akan menggunakan plugin `hrsh7th/nvim-cmp`. Alasan pertama karna plugin ini sudah matang dan terdapat banyak sumber untuk memperlajari arsitektur dari plugin ini. Alasan kedua adalah karna plugin `saghen/blink.cmp` saat ini pada tanggal 25 Januari 2025 masih tahap beta sehingga masih cukup banyak bug dan juga masih akan terdapat breaking changes.

## Instalasi 

```lua
return {
    'hrsh7th/nvim-cmp',
    opts = function()
    end
}
```

## Setup
Secara garis besar berikut adalah apa saja yang akan saya setup: 
- Pertama melakukan setup general untuk semua kondisi, 
- kedua setup saat melakukan searching menggunakan `/` atau `?`, 
- dan yang terakhir setup saat untuk kondisi saat menjalankan command menggunakan `:`

```lua
opts = function()
    local cmp = require("cmp")
    cmp.setup({})

    cmp.setup.cmdline({ '/', '?' }, {})

    cmp.setup.cmdline(':', {},
      matching = { disallow_symbol_nonprefix_matching = false }
    })
end
```
## Setup General

### snippet engine
Mendefinisikan snippet engine apa yang digunakan

```lua
cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
})
```

Disini saya menggunakan snippet engine dari plugin `L3MON4D3/LuaSnip`. sebenarnya kita bisa menggunakan snippet engine native dari Neovim jika kita menggunakan Neovim versi 0.10 keatas, namun sampai saya menulis ini terdapat beberapa completion source yang tidak bisa di handle oleh snippet engine ini.

### Autocompletion Source
Listing/registering completion source yang digunakan, urutan penempatan source akan mempengaruhi pada urutan berapa saran completion dari sebuah source akan ditampilkan.

```lua
cmp.setup({
    sources = {
      { name = 'luasnip' },
      { name = "nvim_lsp" },
      { name = 'nvim_lua' },
      { name = "path" },
      { name = "buffer" },
    },
})
```

### Keymap
Mapping keymap/tombol yang digunakan untuk mengoprasikan autocompletion.

```lua
cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
})
```

Disini saya menggunakan keymaps default dan kemudian saya tambahkan (insert) keymap saya sendiri

### Window
Mengatur bagaimana style dari window atau popup autocompletion.

```lua
cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
})
```

```lua
opts = function()
    local cmp = require("cmp")
    cmp.setup({
      snippet = {}, 
      sources = {}, -- 
      mapping = cmp.mapping.preset.insert({}), --       window = {}, -- style window atau style pop up saran autocompletion
      formatting = {
        format = function(entry, vim_item)
          -- vim_item.kind = "ini adalah kind"
          -- vim_item.menu = "ini adalah menu"
          -- vim_item.kind = ({
          --   Function = "F",
          --   buffer = "[Buffer]",
          --   nvim_lsp = "[LSP]",
          --   luasnip = "[LUASNIP]"
          -- })[entry.source.name]

          -- vim_item.menu = ({
          --   buffer = "[Buffer]",
          --   nvim_lsp = "[LSP]",
          --   luasnip = "[LUASNIP]"
          -- })[entry.source.name]

          vim_item.menu = entry.source.name
          vim_item.kind = vim_item.kind

          return vim_item
        end
      }
    })

    -- `/` cmdline setup. ketika melalukan searching dengan / atau ?
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'path' },
        { name = 'cmdline' }
      },
      matching = { disallow_symbol_nonprefix_matching = false }
    })
end
```


