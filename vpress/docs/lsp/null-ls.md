Linter dan formatter seperti Black, ESLint, dan Prettier adalah command-line tools yang biasanya digunakan melalui terminal. Kita dapat menginstalnya menggunakan Mason untuk mempermudah pengelolaan dan memastikan alat-alat tersebut tersedia di sistem. Namun, jika kita ingin menggunakannya secara otomatis, seperti memformat kode setiap kali menyimpan file, hanya menginstalnya saja tidak cukup, karena alat-alat tersebut harus dijalankan secara manual melalui terminal.

Untuk mengatasi keterbatasan ini, kita dapat menggunakan plugin seperti `null-ls`, yang membungkus command-line tools linting dan formatting tersebut sehingga mereka bertindak seperti Language Server Protocol (LSP). Dengan cara ini, `null-ls` memungkinkan alat-alat tersebut berkomunikasi langsung dengan Neovim's built-in LSP client. Akibatnya, kita dapat memanfaatkan fitur bawaan Neovim, seperti linting otomatis, formatting saat menyimpan file, atau code actions, tanpa memerlukan plugin tambahan untuk setiap alat.

Manfaat utama dari `null-ls` adalah penyederhanaan integrasi berbagai command-line tools ke dalam satu pipeline yang menggunakan standar LSP. Dengan cara ini, kita tidak perlu menginstal banyak plugin terpisah untuk linting dan formatting; `null-ls` menyatukan semua alat tersebut sebagai generalisasi LSP, sehingga proses linting dan formatting menjadi lebih efisien dan terintegrasi.

Namun, karena `null-ls` sudah deprecated, kita sekarang menggunakan `none-ls`, yang merupakan fork dari `null-ls` dan dikelola oleh komunitas. `None-ls` tetap menjaga fungsionalitas yang sama seperti `null-ls`, sehingga memungkinkan kita untuk terus menikmati manfaat integrasi dan efisiensi dalam mengelola linting dan formatting tools di Neovim.

### Langkah-langkah Menggunakan `Mason` dan `None-ls`

1. **Menginstal Linter atau Formatter** Kita dapat menginstal linter atau formatter menggunakan GUI Mason dengan perintah `:Mason.` agar memudahkan saat mendaftarkan nanti, kita sebaiknya pastikan tool yang diinstall terdapat builtinsnya pada none_ls.

- registry Mason : https://mason-registry.dev/registry/list
- list builtins none-ls : https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md

2. **Mendaftarkan ke Plugin None-ls** setelah tools diinstal, daftarkan linter atau formatter ke dalam konfigurasi plugin `none-ls` agar dapat digunakan sebagai sumber LSP. Contoh konfigurasi untuk `none-ls`:

   ```lua
   local none_ls = require("none-ls")

   none_ls.setup({
     sources = {
       none_ls.builtins.formatting.stylua, -- Formatter untuk Lua
       none_ls.builtins.formatting.black, -- Formatter untuk Python
       none_ls.builtins.diagnostics.eslint, -- Linter untuk JavaScript/TypeScript
     },
   })
   ```

Dengan konfigurasi ini, alat linting dan formatting akan terintegrasi dengan Neovim secara langsung, memungkinkan fitur seperti formatting otomatis saat menyimpan file atau linting langsung di editor tanpa perlu menjalankan alat-alat tersebut secara manual melalui terminal. Kombinasi Mason dan `none-ls` menyediakan pipeline yang terintegrasi, efisien, dan mudah dikelola.

### simplifikasi dengan plugin jay-babu/mason-null-ls.nvim 
langkah instalasi manual cukup ribet dimana kita mencocokan terlebih dahulu package yang diinstall dari mason dengan builtin nonels, lalu mendaftarkannya pada plugin none-ls. untuk menyederhanakannya proses installasi kita bisa menggunakan plugin mason-null-ls. 

untuk mengistall package kita hanya perlu menambahkan nama package pada field ensure_installed pada setup mason-null-ls.
note : nama package pada mason-null-ls menggunakan nama package null-ls
translate between null-ls source names and mason.nvim package names (e.g. haml_lint <-> haml-lint)

```lua
  config = function()
  require("mason-null-ls").setup({
      ensure_installed = {
          -- Opt to list sources here, when available in mason.
          -- Note: this plugin uses the null-ls source names in the APIs it exposes - not mason.nvim package names.
          "stylua",
      },
      automatic_installation = false,
      handlers = {},
  })
  require("null-ls").setup({
      sources = {
          -- Anything not supported by mason.
      }
  })
end,
```
jika ada package yang tidak disupport oleh mason, kita bisa tulis nama package tersebut pada field sources pada setup null-ls.

dengan mason-null-ls ini kita hanya perlu menuliskan nama pacakge saja, maka secara otomatis mason akan menginstalnya dan null-ls akan mendaftarkannya.
