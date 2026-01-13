return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_DiffCommand = "FC"
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.opt.undodir = os.getenv('HOMEPATH') .. '/.nvim/undodir'
    vim.opt.undofile = true
    vim.opt.backup = false
	end,
}
