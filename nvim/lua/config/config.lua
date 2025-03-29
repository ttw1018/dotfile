local o = vim.o
local g = vim.g

g.mapleader = " "
o.clipboard = "unnamedplus"
-- o.number = true
-- o.relativenumber = true
-- o.ignorecase = true
o.undofile = true
o.swapfile = false
o.backup = false
o.cursorline = true
o.background = "light"
o.shiftwidth = 2

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex" },
  callback = function()
    o.shiftwidth = 8
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 1 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
    end
  end,
})
