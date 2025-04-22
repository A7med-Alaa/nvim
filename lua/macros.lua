local loggroup = vim.api.nvim_create_augroup("JSLogMacro", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = loggroup,
  pattern = "cpp",
  callback = function()
    vim.fn.setreg("l", "yostd::cout << \"pa\" << std::endl;")
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = loggroup,
  pattern = { "javascript", "typescript" },
  callback = function()
    vim.fn.setreg("l", "yoconsole.log(\"pa:\", pa);\"")
  end,
})
vim.api.nvim_create_autocmd("FileType", {
  group = loggroup,
  pattern = "java",
  callback = function()
    vim.fn.setreg("l", "yoSystem.out.println(\"pa: \" + pa);\"")
  end,
})
