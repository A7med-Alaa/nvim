return {
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.8",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-ui-select.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local file_ignore_patterns = {
				"yarn%.lock",
				"node_modules/",
				"raycast/",
				"dist/",
				"%.next",
				"%.git/",
				"%.gitlab/",
				"build/",
				"target/",
				"package%-lock%.json",
			}

			require("telescope").setup({
				defaults = {
					file_ignore_patterns = file_ignore_patterns,

					path_display = {
						filename_first = {
							reverse_directories = true,
						},
					},

					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
							["<c-d>"] = require("telescope.actions").delete_buffer,
						},
					},
				},
				pickers = {
					find_files = {
						theme = "ivy",
					},
				},
				extensions = {
					extensions = {
						fzf = {
							fuzzy = true, -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "smart_case", -- or "ignore_case" or "respect_case"
							-- the default case_mode is "smart_case"
						},
					},
					-- ["ui-select"] = {
					-- 	-- require("telescope.themes").get_dropdown({}),
					-- 	require("telescope.themes").get_ivy({}),
					-- },
				},
			})

			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>o", function()
				builtin.buffers({ show_all_buffers = true, sort_lastused = true, ignore_current_buffer = true })
			end)
			vim.keymap.set("n", "<leader><leader>", function()
				builtin.find_files({ no_ignore = true, hidden = true })
			end, { desc = "Telescope find files" })

			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep > ") })
			end, { desc = "Search a word in all files" })

			vim.keymap.set("n", "<leader>pws", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end, { desc = "Search a word under cursor" })

			vim.keymap.set("n", "<leader>pWs", function()
				local word = vim.fn.expand("<cWORD>")
				builtin.grep_string({ search = word })
			end, { desc = "Telescope find WORD under cursor" })
		end,
	},
}
