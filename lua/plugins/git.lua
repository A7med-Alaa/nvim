return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})

			vim.keymap.set("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>")
			-- vim.keymap.set("n", "<leader>gdf", function()
			-- 	-- local relative_path = vim.fn.expand("%")
			-- 	--     local filename = vim.fn.expand("%:t")
			-- 	-- vim.cmd("tab Git diff " .. relative_path .. " | file Git Diff " .. filename)
			--      vim.cmd("Gitsigns diffthis")
			-- end, { desc = "Git Diff of Current File relative to the Index" })
		end,
	},
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()

			vim.keymap.set("n", "<leader>gd", function()
				vim.cmd("DiffviewOpen")
			end, { desc = "Git Diff of All Files relative to the Index" })
    end,
  },
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
			vim.keymap.set("n", "<leader>gs", ":Git status<CR>")

			vim.keymap.set("n", "<leader>gl", function()
				vim.cmd("tab Git log | file Git Log")
			end, { desc = "Git Log" })

			vim.keymap.set("n", "<leader>gh", function()
				vim.cmd("tab Git show HEAD | file Git Show HEAD")
			end, { desc = "Git Show HEAD Commit" })

			--Leader Git View
			vim.keymap.set("n", "<leader>gv", function()
				local commit = vim.fn.expand("<cword>")
				vim.cmd("tab Git show " .. commit .. " | file Git Show " .. commit:sub(1, 7))
			end, { desc = "Git Show Commit Under Cursor" })
		end,
	},
}
