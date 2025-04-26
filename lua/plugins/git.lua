return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({ current_line_blame = true })

			vim.keymap.set("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>")
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup()

			vim.keymap.set("n", "<leader>gd", function()
				vim.cmd("DiffviewOpen")
			end, { desc = "Git Diff of All Files" })
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
			vim.keymap.set("n", "<leader>gs", ":Git status<CR>")
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")

			vim.keymap.set("n", "<leader>gl", function()
				vim.cmd("tab Git log --all --graph --decorate --parents --oneline | file Git Log")
			end, { desc = "Git Log" })

			vim.keymap.set("n", "<leader>gh", function()
				vim.cmd("tab Git show HEAD | file Git Show HEAD")
			end, { desc = "Git Show HEAD Commit" })

			--Leader Git View
			vim.keymap.set("n", "<leader>gv", function()
				local commit = vim.fn.expand("<cword>")
				vim.cmd("tab Git show " .. commit .. " | file Git Show " .. commit:sub(1, 7))
			end, { desc = "Git Show Commit Under Cursor" })

			vim.keymap.set("n", "<leader>gr", function()
				local commit = vim.fn.expand("<cword>")
				vim.cmd("tab Git reset --soft " .. commit)
			end, { desc = "Git Reset soft (the index) to the Commit Under Cursor" })

			vim.keymap.set("n", "<leader>gr", function()
				local word_for_commit = vim.fn.expand("<cword>") -- gets the word under the cursor
				local word_for_reflog = vim.fn.expand("<cWORD>") -- gets the word under the cursor
				local commit = word_for_commit:match("^%x+$")
				local reflog = word_for_reflog:match("^HEAD@{%d+}:$")

				if not (commit or reflog) then
					vim.cmd("tab Git reflog | file Git Reflog")
					return
				end

				local options = {}
				if commit then
					table.insert(options, "git reset --soft " .. word_for_commit)
					table.insert(options, "git reset --hard " .. word_for_commit)
					table.insert(options, "git revert " .. word_for_commit)
					table.insert(options, "git checkout " .. word_for_commit)
				else
					table.insert(options, "git reset --soft " .. string.sub(word_for_reflog, 1, -2))
					table.insert(options, "git reset --hard " .. string.sub(word_for_reflog, 1, -2))
				end

				vim.ui.select(options, { prompt = "Choose Git action" }, function(choice)
					if not choice then
						return
					end

					-- Run the selected git command
					vim.fn.jobstart(choice, {
						stdout_buffered = true,
						on_stdout = function(_, data)
							if data then
								for _, line in ipairs(data) do
									print(line)
								end
							end
						end,
						on_stderr = function(_, data)
							if data then
								for _, line in ipairs(data) do
									vim.notify(line, vim.log.levels.ERROR)
								end
							end
						end,
						on_exit = function()
							vim.notify(choice, vim.log.levels.INFO)
						end,
					})
				end)
			end, { desc = "Git: choose action for commit under cursor" })
		end,
	},
}
