return {
  "neovim/nvim-lspconfig",
  -- event = "InsertEnter",
  version = "*",
  ft = {
    "tex",
    "python",
    "lua",
    "cpp",
    "c",
    "go",
    "vue",
    "ts",
    "js",
  },
  dependencies = { "williamboman/mason.nvim" },
  opts = {
    on_attach = function()
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "gi", vim.lsp.buf.implementation, opts)
      map("n", "gr", vim.lsp.buf.references, opts)

      map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      map("n", "<leader>rn", vim.lsp.buf.rename, opts)
      map("n", "<leader>fm", vim.lsp.buf.format, opts)
      map("n", "<leader>k", vim.lsp.buf.hover, opts)
      map("n", "<leader>d", vim.diagnostic.open_float, opts)

      -- local ft = vim.bo.filetype
      -- if ft == "tex" then
      --   map("n", "<leader>ll", "<cmd>TexlabBuild<cr>")
      --   map("n", "<leader>jj", "<cmd>TexlabForward<cr>")
      -- end
    end,

    servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              },
            },
          },
        },
      },
      texlab = {
        settings = {
          texlab = {
            build = {
              executable = "latexmk",
              args = {
                "--silent",
                "-synctex=1",
                "-interaction=nonstopmode",
                "-outdir=build",
                "-xelatex",
                "%f",
              },
              -- executable = "tectonic",
              -- args = {
              --   "-X",
              --   "compile",
              --   "%f",
              --   "--synctex",
              --   "--keep-logs",
              --   "--keep-intermediates",
              --   "--outdir",
              --   "build",
              -- },

              pdfDirectory = "build",
            },
            forwardSearch = {
              executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
              args = {
                "-r",
                "-b",
                "-g",
                "%l",
                "%p",
                "%f",
              },
            },
          },
        },
      },
      -- ltex = {
      --   settings = {
      --     ltex = {
      --       language = "zh-CN",
      --     },
      --   },
      -- },
      pyright = {},
      clangd = {},
      volar = {},
    },
  },

  config = function(_, opts)
    local lspconfig = require("lspconfig")
    for server, config in pairs(opts.servers) do
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      config.on_attach = opts.on_attach
      lspconfig[server].setup(config)
    end
  end,
}
