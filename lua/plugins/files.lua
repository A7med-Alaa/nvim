return {

	{
		"echasnovski/mini.files",
		version = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			vim.keymap.set("n", "-", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open parent directory" })
			vim.keymap.set("n", "<leader>/", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open parent directory" })
			require("mini.files").setup({
				options = {
					use_as_default_explorer = false,
				},
				windows = {
					preview = true,
					width_focus = 35,
					width_preview = 50,
				},
				mappings = {
					close = "q",
					go_in = "<Right>",
					go_in_plus = "<CR>",
					go_out = "h",
					go_out_plus = "<Left>",
					mark_goto = "'",
					mark_set = "m",
					reset = ",",
					reveal_cwd = ".",
					show_help = "g?",
					synchronize = "s",
					trim_left = "<",
					trim_right = ">",
				},
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})
			vim.keymap.set("n", "<C-n>", "<CMD>NvimTreeToggle<CR>")
		end,
	},

	-- {
	-- 	"stevearc/oil.nvim",
	-- 	---@module 'oil'
	-- 	---@type oil.SetupOpts
	-- 	opts = {},
	-- 	-- Optional dependencies
	-- 	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- 	config = function()
	-- 		require("oil").setup({
	--        skip_confirm_for_simple_edits = true,
	--        delete_to_trash = true,
	-- 			view_options = {
	-- 				show_hidden = true,
	-- 			},
	-- 		})
	--
	-- 		vim.keymap.set("n", "-", "<CMD>Oil --float <CR>", { desc = "Open parent directory" })
	-- 		vim.keymap.set("n", "<C-n>", function()
	-- 			vim.cmd((vim.bo.filetype == "oil") and "bd" or "Oil")
	-- 		end)
	-- 	end,
	-- 	lazy = false,
	-- },
}
