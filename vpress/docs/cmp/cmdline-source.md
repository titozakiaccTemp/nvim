# Cmdline Source :wrench:
Cmdline source adalah source yang berisi autocompletion untuk perintah-perintah yang tersedia pada command line Neovim. :computer:

## Instalasi :rocket:

```lua
return {
	"hrsh7th/cmp-cmdline"
}
```

## Integrasi dengan Autocompletion Engine :gear:
Agar source ini dapat tersedia dan digunakan pada fitur autocompletion, kita harus mendaftarkannya terlebih dahulu pada konfigurasi autocompletion engine. :hammer:

```lua
opts = function()
    local cmp = require("cmp")
		cmp.setup.cmdline(":", {
			sources = {
				{ name = "cmdline" },
			},
			matching = { disallow_symbol_nonprefix_matching = false },
		})
end
```

Di sini, kita hanya mendaftarkan source ini untuk kondisi saat menjalankan command menggunakan : saja. Alasannya adalah karena selain kondisi tersebut, kita tidak memerlukan fitur ini. Selain itu, fitur ini bisa cukup mengganggu jika didaftarkan untuk kondisi lain. :warning:

## Hasil :sparkles: 

### Before :arrow_backward:
<img src="https://raw.githubusercontent.com/rizkia-as-pac/nvim/refs/heads/main/public/2025-01-28_08-10.png" width="400">

### After :arrow_forward:
<img src="https://raw.githubusercontent.com/rizkia-as-pac/nvim/refs/heads/main/public/2025-01-28_08-17.png" width="400">
