return {
  "saghen/blink.cmp",
  event = { "InsertEnter" },
  version = "*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = {
      preset = "super-tab",
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets" },
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
    },
    fuzzy = {
      implementation = "rust",
      prebuilt_binaries = {
        force_version = "v0.13.1",
      },
    },
  },
  opts_extend = { "sources.default" },
}
