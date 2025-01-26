return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		-- Add current file to Harpoon list
		vim.keymap.set("n", "<M-a>", function()
			harpoon:list():add()
		end, { desc = "Add file to Harpoon" })

		-- Toggle Harpoon quick menu
		vim.keymap.set("n", "<M-s>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon Quick Menu" })

		-- Function to navigate to a specific file
		local function to_file(index)
			return function()
				harpoon:list():select(index)
			end
		end

		vim.keymap.set("n", "<M-u>", to_file(1), { desc = "Go to file 1 in Harpoon" })
		vim.keymap.set("n", "<M-i>", to_file(2), { desc = "Go to file 2 in Harpoon" })
		vim.keymap.set("n", "<M-o>", to_file(3), { desc = "Go to file 3 in Harpoon" })
		vim.keymap.set("n", "<M-p>", to_file(4), { desc = "Go to file 4 in Harpoon" })

		-- basic telescope configuration
		local teleConf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = teleConf.file_previewer({}),
					sorter = teleConf.generic_sorter({}),
				})
				:find()
		end

		vim.keymap.set("n", "<M-S>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open harpoon window" })
	end,
}
