local o = vim.o
local g = vim.g

g.mapleader = " "
o.clipboard = "unnamedplus"
o.number = true
o.relativenumber = true
-- o.ignorecase = true
o.undofile = true
o.swapfile = false
o.backup = false
o.cursorline = true
o.scrolloff = 5
o.background = "light"
o.shiftwidth = 2

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex" },
  callback = function()
    o.shiftwidth = 8
  end,
})
