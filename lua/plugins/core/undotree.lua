return {
  "mbbill/undotree",
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>z", vim.cmd.UndotreeToggle, desc = "Toggle undo tree" },
  },
}
