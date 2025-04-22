require("macros")
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.incsearch = true

vim.g.mapleader =  " "
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = false
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = "indent"
vim.opt.shortmess = vim.opt.shortmess + 'A' -- ignore annoying swapfile messages
vim.opt.swapfile = false -- don't create swap files

vim.opt.completeopt = vim.opt.completeopt + 'noselect'

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.background = "dark"

vim.diagnostic.config({ virtual_lines = { current_line = true } })
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<leader>bd", ":bd<CR>")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]])
--
-- vim.o.statusline = table.concat({
--   "%f",
--   "%h%m%r ", -- flags
--   "| %{get(b:,'gitsigns_head','')}",
--   "%=", -- separate left and right sections
--   "  %{luaeval(\"require('statusline_functions').lsp_status()\")}",
--   "  %{luaeval(\"require('statusline_functions').lsp_progress()\")}",
--   "%l,%c  ",
--   "%P ", -- percentage through file position
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

-- vim.api.nvim_create_autocmd("BufEnter", {
--   group = vim.api.nvim_create_augroup("HideTabs", {}),
--   pattern = "*.*",
--   callback = function ()
--     vim.cmd("set showtabline=0")
--   end
-- })

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspAttach", {}),
  callback = function(ev)
    local opts = {buffer = ev.buf}
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end
})
require("config.lazy")

