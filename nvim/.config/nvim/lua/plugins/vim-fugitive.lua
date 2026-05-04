return {
	"tpope/vim-fugitive",
	config = function()
		-- Example: map :G status to <leader>gs
		vim.api.nvim_set_keymap("n", "<leader>gs", ":Gstatus<CR>", { noremap = true, silent = true })
	end,
}
