return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})

			vim.keymap.set("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>")
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
			vim.keymap.set("n", "<leader>gs", ":Git status<CR>")
			vim.keymap.set("n", "<leader>gd", ":Git diff HEAD<CR>")
			vim.keymap.set("n", "<leader>gl", ":Git log<CR>")
			--Leader Git View
			vim.keymap.set("n", "<leader>gv", function()
        local word  = vim.fn.expand("<cword>")
        vim.cmd("Git show " .. word)
      end, { desc = "Git Show Commit Under Cursor" })
		end,
	},
}
