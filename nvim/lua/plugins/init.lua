return {
  {
    "hadronized/hop.nvim",
    version = "*",
    keys = {
      { "F", "<cmd>HopChar1<cr>" },
    },
    config = function()
      require("hop").setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    version = "*",
    lazy = true,
    config = function()
      require("nvim-web-devicons").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  {
    "ibhagwan/fzf-lua",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>" },
      { "<leader>lg", "<cmd>FzfLua live_grep<cr>" },
      { "<leader>fh", "<cmd>FzfLua helptags<cr>" },
      { "<leader>fo", "<cmd>FzfLua oldfiles<cr>" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>" },
      { "<leader>fd", "<cmd>FzfLua lsp_workspace_diagnostics<cr>" },
      { "<leader>fj", "<cmd>FzfLua jumps<cr>" },
      { "<leader>fm", "<cmd>FzfLua marks<cr>" },
      { "<leader>tt", "<cmd>FzfLua<cr>" },
    },
    config = function()
      require("fzf-lua").setup({
        fzf_colors = {
          true,
        },
      })
    end,
  },

  {
    "numToStr/Navigator.nvim",
    version = "*",
    keys = {
      { "<C-h>", "<cmd>NavigatorLeft<cr>" },
      { "<C-l>", "<cmd>NavigatorRight<cr>" },
      { "<C-k>", "<cmd>NavigatorUp<cr>" },
      { "<C-j>", "<cmd>NavigatorDown<cr>" },
    },
    config = function()
      require("Navigator").setup()
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        signs_staged = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
        },
      })
    end,
  },

  {
    "folke/snacks.nvim",
    version = "*",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      scroll = { enabled = true },
    },
  },

  {
    "williamboman/mason.nvim",
    version = "*",
    lazy = true,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    version = "*",
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "lervag/vimtex",
    version = "*",
    init = function()
      local g = vim.g
      g.vimtex_view_method = "skim"
      g.vimtex_compiler_latexmk_engines = {
        _ = "-xelatex",
      }
      g.vimtex_compiler_latexmk = {
        aux_dir = "build",
        out_dir = "build",
        continuous = 1,
        options = {
          "-verbose",
          "-synctex=1",
          "-file-line-error",
          "-interaction=nonstopmode",
          "-outdir=build",
        },
      }
      g.vimtex_quickfix_open_on_warning = 0
      g.vimtex_quickfix_ignore_filters = {
        -- "Warning",
        -- "Missing",
      }
      local map = vim.keymap.set
      map("n", "<leader>ll", "<cmd>VimtexCompile<cr>")
      map("n", "<leader>jj", "<cmd>VimtexView<cr>")
    end,
  },
}
