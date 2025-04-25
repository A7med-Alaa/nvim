return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_enable_italic = false
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_foreground = "mix"
		vim.g.gruvbox_material_statusline_style = "original"
		vim.g.gruvbox_material_disable_italic_comment = true
		vim.g.gruvbox_material_transparent_background = 2
		vim.g.gruvbox_material_ui_contrast = "low"
		vim.cmd.colorscheme("gruvbox-material")

		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#828697", bg = "none" })
		vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = "#828697", bg = "none" }) -- optional border styling
		vim.api.nvim_set_hl(0, "MiniFilesFile", { fg = "#d4d4d4" }) -- optional border styling

		-- Set tab backgrounds using the gray variant #828697
		vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#828697", bg = "none", bold = true })
		vim.api.nvim_set_hl(0, "TabLine", { fg = "#5A5D6B", bg = "none" }) -- Darker variant
		vim.api.nvim_set_hl(0, "TabLineFill", { fg = "#5A5D6B", bg = "none" }) -- Even darker variant
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#101216" })
		-- vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#828697", bg = "#101216" })
		-- vim.api.nvim_set_hl(0, "MiniFilesTitle", { fg = "#828697", bg = "#101216" }) -- optional border styling
		-- vim.api.nvim_set_hl(0, "MiniFilesFile", { fg = "#d4d4d4" }) -- optional border styling
		-- vim.api.nvim_set_hl(0, 'LineNrAbove', { fg='#77948b', bold=true })
		-- vim.api.nvim_set_hl(0, 'LineNr', { fg='#b09c84', bold=true })
		-- vim.api.nvim_set_hl(0, 'LineNrBelow', { fg='#c37b90', bold=true })
	end,
	-- {
	--   "vague2k/vague.nvim",
	--   config = function()
	--     -- NOTE: you do not need to call setup if you don't want to.
	--     require("vague").setup({
	--       transparent = true,
	--     })
	--     vim.cmd.colorscheme('vague')
	--   end
	-- },
	--
}
