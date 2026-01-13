require("macros")
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.incsearch = true

vim.g.mapleader = " "
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
vim.opt.swapfile = false

vim.opt.completeopt = vim.opt.completeopt + 'noselect'

vim.opt.scrolloff = 6
vim.opt.updatetime = 50
vim.opt.background = "dark"

-- vim.diagnostic.config({ virtual_lines = { current_line = true }})
vim.diagnostic.config({ virtual_text = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
-- Alt key for moving between windows and equalize and maxmize them 
vim.keymap.set("n", "<A-Left>", "<C-w>h")
vim.keymap.set("n", "<A-Down>", "<C-w>j")
vim.keymap.set("n", "<A-Up>", "<C-w>k")
vim.keymap.set("n", "<A-Right>", "<C-w>l")

vim.keymap.set('n', '<A-=>', '<C-w>=', { noremap = true, silent = true})
vim.keymap.set('n', '<A-\\>', '<C-w>|', { noremap = true, silent = true})

-- Control key for resizing windows
vim.keymap.set('n', '<C-Right>', '5<C-w>>', { noremap = true, silent = true})
vim.keymap.set('n', '<C-Left>', '5<C-w><', { noremap = true, silent = true})
vim.keymap.set('n', '<C-Up>', '5<C-w>+', { noremap = true, silent = true})
vim.keymap.set('n', '<C-Down>', '5<C-w>_', { noremap = true, silent = true})

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<leader>bd", ":bd<CR>")

vim.keymap.set("n", "<leader>td", ":tabc<CR>")
vim.keymap.set("n", "[t", ":tabprevious<CR>")
vim.keymap.set("n", "]t", ":tabNext<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<left><left><left>]])

-- Escape for normal mode in terminal buffer
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LspAttach", {}),
  callback = function(ev)
    local opts = {buffer = ev.buf}
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set({"i", "n"}, "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end
})
require("config.lazy")

