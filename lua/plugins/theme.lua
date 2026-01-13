return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_enable_italic = false
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_foreground = "mix"
		vim.g.gruvbox_material_statusline_style = "original"
		-- vim.g.gruvbox_material_disable_italic_comment = true
		vim.g.gruvbox_material_transparent_background = 2
		vim.g.gruvbox_material_ui_contrast = "high"
    vim.g.gruvbox_material_better_performance = 1
		vim.cmd.colorscheme("gruvbox-material")

		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#101216" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
		-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#828697", bg = "#101216" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#828697", bg = "#000000" })
		-- vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = "#828697", bg = "#101216" }) -- optional border styling
		vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = "#828697", bg = "#000000" }) -- optional border styling
		vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { fg = "#828697", bg = "#000000" }) -- optional border styling
		vim.api.nvim_set_hl(0, "MiniFilesFile", { fg = "#d4d4d4" }) -- optional border styling
		-- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#77948b', bold=true })
		-- vim.api.nvim_set_hl(0, 'LineNr', { fg='#b09c84', bold=true })
		-- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#c37b90', bold=true })
	end,
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000,
	--   config = function()
	--     require("catppuccin").setup({
	--       transparent_background = false,
	--     })
	--     vim.cmd.colorscheme("catppuccin")
	--   end
	-- }
	-- {
	--   "vague2k/vague.nvim",
	--   config = function()
	--     -- NOTE: you do not need to call setup if you don't want to.
	--     vim.cmd.colorscheme('vague')
	--     require("vague").setup({
	--     })
	--   end
	-- },
	--
	-- "folke/tokyonight.nvim",
	-- lazy = false,
	-- priority = 1000,
	-- opts = {},
	-- config = function()
	--
	--   require("tokyonight").setup({
	--     transparent = true,
	--     styles = {
	--       keywords = { italic = false }
	--     }
	--   })
	--   vim.cmd[[colorscheme tokyonight-night]]
	-- end
}
