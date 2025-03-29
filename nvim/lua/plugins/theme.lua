return {
  {
    "folke/tokyonight.nvim",
    version = "*",
    lazy = false,
    config = function()
      local tokyonight = require("tokyonight")
      tokyonight.setup({
        style = "day",
        on_highlights = function(hl, _)
          hl.TabLineFill = {
            bg = "#E4E4E4",
          }
          hl.TabLineSel = {
            fg = "#2e7de9",
            bg = "#a8aecb",
          }
          hl.TabLine = {
            fg = "#6172b0",
            bg = "#d0d5e3",
          }
          hl.GitSignsAdd = {
            fg = "green",
          }
          hl.GitSignsChange = {
            fg = "orange",
          }
          hl.GitSignsDelete = {
            fg = "red",
          }
        end,
      })
      tokyonight.load()
    end,
  },
}
