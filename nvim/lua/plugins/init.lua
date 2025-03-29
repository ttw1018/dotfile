return {
  {
    "hadronized/hop.nvim",
    version = "*",
    keys = {
      { "F", mode = { "n", "x", "o" }, "<cmd>HopChar1<cr>" },
    },
    config = function()
      require("hop").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>" },
    },
    config = function()
      require("nvim-tree").setup()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
  },
  {
    "ibhagwan/fzf-lua",
    version = "*",
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
    event = "BufReadPre",
    cond = function()
      local git_dir = vim.fs.find(".git", { upward = true, type = "directory" })
      return not vim.tbl_isempty(git_dir)
    end,
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
    event = "VeryLazy",
    opts = {
      bigfile = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      scroll = { enabled = true },
    },
  },

  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    event = "BufReadPre",
    version = "*",
    lazy = true,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "echasnovski/mini.pairs",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.pairs").setup()
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "Sa", -- Add surrounding in Normal and Visual modes
          delete = "Sd", -- Delete surrounding
          find = "Sf", -- Find surrounding (to the right)
          find_left = "SF", -- Find surrounding (to the left)
          highlight = "Sh", -- Highlight surrounding
          replace = "Sr", -- Replace surrounding
          update_n_lines = "Sn", -- Update `n_lines`
        },
      })
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
      -- map("n", "<leader>jj", "<cmd>VimtexView<cr>")
    end,
  },
}
