vim.api.nvim_create_autocmd({ "CursorMoved" }, {
	callback = function()
		-- normal buffer (not terminal or prompt)
		if vim.bo.buftype ~= "" then
			return
		end

		local windowLines = vim.api.nvim_win_get_height(0)
		local currLine = vim.fn.line(".")
		local lastLine = vim.fn.line("$")

		-- to handle a file smaller than window
		local bottom = 0
		if windowLines > lastLine then
			bottom = windowLines
		else
			bottom = lastLine
		end

		local marginBottom = currLine + vim.o.scrolloff - bottom
		if marginBottom == 0 then
			vim.api.nvim_input("zb") -- align cursor with bottom of file
		elseif marginBottom > 0 then
			vim.api.nvim_input("zb") -- align cursor with bottom of file
			vim.api.nvim_input(marginBottom .. "<C-E>") -- scroll down
		end
	end,
})
