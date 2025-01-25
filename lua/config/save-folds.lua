-- Create an augroup for remembering folds
vim.api.nvim_create_augroup("remember_folds", { clear = true })

-- Save the folds when leaving a buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = "remember_folds",
  callback = function()
    if vim.fn.expand("%") ~= "" then -- Check if the buffer has a file name
      vim.cmd("mkview")
    end
  end,
})

-- Load the folds when entering a buffer
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "remember_folds",
  callback = function()
    if vim.fn.expand("%") ~= "" then -- Check if the buffer has a file name
      vim.cmd("silent! loadview")
    end
  end,
})
