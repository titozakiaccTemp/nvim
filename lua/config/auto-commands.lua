-- close quickfix menu after selecting choice
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf" },
  group = vim.api.nvim_create_augroup("close-qf-after-select", { clear = true }),
  command = [[nnoremap <buffer> <CR> <CR>:lclose<CR>]],
})

-- vim.api.nvim_create_autocmd(
--  "BufReadPost",
--  { pattern = "locationlist", command = [[nnoremap <buffer> <CR <CR>:quit<CR>]] }
-- )

-- Function to run the script asynchronously
local function run_shell_script(script_file_name)
  -- Check if the script path is provided
  if not script_file_name or script_file_name == "" then
    print("Error: No script path provided!")
    return
  end

  -- Use `vim.fn.jobstart` to run the script asynchronously
  local shell_scripts_path = "~/.config/nvim/lua/config/shell-scripts/"
  vim.fn.jobstart(shell_scripts_path .. script_file_name, {
    on_exit = function(_, code, _)
      if code ~= 0 then
        print("Script exited with code: " .. code)
      else
        print("Script executed successfully!")
      end
    end,
  })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yangking text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
--   desc = "Toggle youtube play/pause when enter/leave Insert mode.  Also for Replace mode and Virtual Replace mode.",
--   group = vim.api.nvim_create_augroup("insert-toggle-youtube", { clear = true }),
--   pattern = "*.zig",
--   callback = function()
--     local script_file_name = "toggle-youtube.sh"
--     run_shell_script(script_file_name)
--   end,
-- })
