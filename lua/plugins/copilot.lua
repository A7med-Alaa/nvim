return {
	-- "github/copilot.vim",
	-- config = function ()
	-- vim.g.copilot_no_tab_map = true
	-- vim.api.nvim_set_keymap("i", "<C-Right>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
	--
	-- end
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({})
	end,
	-- "Exafunction/windsurf.nvim",
	-- dependencies = {
	-- 	"nvim-lua/plenary.nvim",
	-- 	"hrsh7th/nvim-cmp",
	-- },
	-- config = function()
	-- 	require("codeium").setup({})
	-- end,
}
