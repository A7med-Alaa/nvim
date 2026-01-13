return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
  -- line 5 and 6 are added if having trouble remove them
	lazy = true,
	event = "BufReadPost", -- loads when a file is opened
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
