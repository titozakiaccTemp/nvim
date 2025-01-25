-- create code images
-- in order to use this neovim plugin, we need to install silicon in our linux system
-- arch => sudo pacman -S silicon
return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  keys = {
    --{ "<leader>s", group = "Silicon" },
    {
      "<leader>uc",
      function()
        require("nvim-silicon").clip()
      end,
      mode = "v",
      desc = "Copy code screenshot to clipboard",
    },
    {
      "<leader>uf",
      function()
        require("nvim-silicon").file()
      end,
      mode = "v",
      desc = "Save code screenshot as file",
    },
  },
  opts = {
    background = "#ffffff",
    theme = "Dracula",
    pad_horiz = 30,
    pad_vert = 30,
    window_title = function()
      return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ":~:.")
    end,
  },
}
