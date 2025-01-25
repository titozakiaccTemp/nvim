return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ff",  "<cmd>Telescope find_files<cr>",  desc = "Lists files in your current working directory, respects .gitignore" },
    { "<leader>fg",  "<cmd>Telescope git_files<cr>" },
    { "<leader>sg",  "<cmd>Telescope live_grep<cr>" },

    { "<leader>muC", "<cmd>Telescope colorscheme<cr>", desc = "Lists Colorscheme" },
  },
  opts = function()
    require('telescope').setup {
      defaults = {},
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      },
      extensions = {
        fzf = {} -- use native fzf to make it better and faster
      }
    }

    vim.keymap.set("n", "<leader>mlp", function()
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      }
    end)
  end,
}
