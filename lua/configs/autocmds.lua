--normalize unix line endings on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.cmd([[silent! %s/\r//g]])
	end,
})
