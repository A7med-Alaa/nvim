return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({ current_line_blame = true })

			vim.keymap.set("n", "<leader>gh", "<CMD>Gitsigns preview_hunk<CR>")
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
			local function open_floating_terminal(cmd, title)
				-- Create a scratch buffer
				local buf = vim.api.nvim_create_buf(false, true)

				-- Calculate size and position
				local width = math.floor(vim.o.columns * 0.8)
				local height = math.floor(vim.o.lines * 0.8)
				local row = math.floor((vim.o.lines - height) / 2)
				local col = math.floor((vim.o.columns - width) / 2)

				-- Create the floating window
				local win = vim.api.nvim_open_win(buf, true, {
					relative = "editor",
					row = row,
					col = col,
					width = width,
					height = height,
					style = "minimal",
					border = "rounded",
					title = title,
					title_pos = "center",
				})

				-- Start the terminal in the buffer
				vim.fn.termopen(cmd or os.getenv("SHELL"))

				-- Optional: close window with `q`
				vim.keymap.set("n", "q", function()
					vim.api.nvim_win_close(win, true)
				end, { buffer = buf })
			end

			-- Create keymap to launch it
			vim.keymap.set("n", "<leader>tt", function()
				open_floating_terminal()
			end, { desc = "Open floating terminal" })

			vim.keymap.set("n", "<leader>ga", ":Git add .<CR>")
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
			vim.keymap.set("n", "<leader>gs", ":Git status<CR>")
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")

			vim.keymap.set("n", "<leader>gl", function()
				vim.cmd("tab Git log --all --graph --decorate --parents --oneline | file Git Log")
			end, { desc = "Git Log" })

			--Leader Git View
			vim.keymap.set("n", "<leader>gv", function()
				local commit = vim.fn.expand("<cword>")
				vim.cmd("tab Git show " .. commit .. " | file Git Show " .. commit:sub(1, 7))
			end, { desc = "Git Show Commit Under Cursor" })

			vim.keymap.set("n", "<leader>gp", function()
				-- Get list of local branches
				local branches = vim.fn.systemlist("git branch --format='%(refname:short)'")
				if vim.v.shell_error ~= 0 then
					vim.notify("Failed to get git branches", vim.log.levels.ERROR)
					return
				end

				local options = {
					"git push origin",
					"git fetch origin",
					"git pull origin",
				}

				vim.ui.select(options, {
					prompt = "Select Git Command",
				}, function(cmd_choice)
					if not cmd_choice then
						return
					end

					vim.ui.select(branches, { prompt = "Choose Git Branch" }, function(branch_choice)
						if not branch_choice then
							return
						end

						local git_command = cmd_choice .. " " .. branch_choice
						local end_delimiter = "echo '\n================================================\n'"
						local title = string.upper(string.sub(cmd_choice, 1, -8))

						local delimiter = function(text)
							return string.format("echo '\n================== %s ==================\n'", text)
						end

						if cmd_choice == "git fetch origin" then
							open_floating_terminal(
								delimiter("Git Fetch")
									.. " && "
									.. git_command
									.. " && "
									.. delimiter("Git Status")
									.. " && "
									.. "git status"
									.. " && "
									.. end_delimiter,
								title
							)
						else
							open_floating_terminal(cmd_choice .. " " .. branch_choice, title)
						end
					end)
				end)
			end, { desc = "Git: push selected branch" })

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
