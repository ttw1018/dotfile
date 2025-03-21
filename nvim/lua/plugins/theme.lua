return {
  {
    "folke/tokyonight.nvim",
    version = "*",
    lazy = true,
    -- config = function()
    --   vim.cmd.colorscheme("tokyonight-moon")
    -- end,
  },
  {
    "rose-pine/neovim",
    version = "*",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("rose-pine-dawn")
    end,
  },
  {
    "catppuccin/nvim",
    version = "*",
    name = "catppuccin",
    lazy = true,
  },
}
