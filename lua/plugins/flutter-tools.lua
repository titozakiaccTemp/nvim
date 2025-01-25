return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    vim.keymap.set("n", "<leader>FS", ":FlutterRun <CR>", {})
    vim.keymap.set("n", "<leader>FQ", ":FlutterQuit <CR>", {})
    vim.keymap.set("n", "<leader>FR", ":FlutterRestart <CR>", {})
    vim.keymap.set("n", "<leader>LR", ":FlutterLspRestart <CR>", {})
    vim.keymap.set("n", "<leader>FD", ":FlutterDevTools <CR>", {})
    require("flutter-tools").setup({
      decorations = {
        statusline = {
          app_version = true,
          device = true,
        },
      },
      dev_tools = {
        autostart = true,         -- autostart devtools server if not detected
        auto_open_browser = true, -- Automatically opens devtools in the browser
      },
      lsp = {
        color = {         -- show the derived colours for dart variables
          enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        },
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "ErrorMsg", -- highlight for the closing tag
        prefix = ">",           -- character to use for close tag e.g. > Widget
        priority = 10,          -- priority of virtual text in current line
        -- consider to configure this when there is a possibility of multiple virtual text items in one line
        -- see `priority` option in |:help nvim_buf_set_extmark| for more info
        enabled = false, -- set to false to disable
      },
    })
  end,
}
