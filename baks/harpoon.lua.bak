return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    -- Basic Harpoon setup
    require("harpoon").setup()

    -- Keybindings for Harpoon
    vim.keymap.set("n", "<M-a>", mark.add_file, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<M-S>", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })

    local function to_file(index)
      return function()
        ui.nav_file(index)
      end
    end

    vim.keymap.set("n", "<M-u>", to_file(1))
    vim.keymap.set("n", "<M-i>", to_file(2))
    vim.keymap.set("n", "<M-o>", to_file(3))
    vim.keymap.set("n", "<M-p>", to_file(4))

    -- Telescope integration for Harpoon
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local sorters = require("telescope.sorters")
    -- local previewers = require("telescope.previewers")

    local function toggle_telescope()
      local harpoon_items = require("harpoon").get_mark_config().marks
      local file_paths = {}

      for _, item in ipairs(harpoon_items) do
        if item.filename then
          table.insert(file_paths, item.filename)
        end
      end

      pickers
          .new({}, {
            prompt_title = "Harpoon Files",
            finder = finders.new_table({
              results = file_paths,
            }),
            sorter = sorters.get_generic_fuzzy_sorter({}),
            -- previewer = previewers.cat.new({}),
          })
          :find()
    end

    vim.keymap.set("n", "<M-s>", toggle_telescope, { desc = "Search Harpoon files with Telescope" })
  end,
}
