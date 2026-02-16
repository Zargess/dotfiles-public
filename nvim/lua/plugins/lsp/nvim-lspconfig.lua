local spell = require("config.spell")

return {
  -- Improved ltex integration, supporting code actions
  { "barreiroleo/ltex-extra.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {},
        -- See this page for settings: https://valentjn.github.io/ltex/settings.html
        ltex = {
          filetypes = {
            "markdown",
            "text",
            "gitcommit",
            "latex",
            "tex",
          },
          settings = {
            ltex = {
              language = spell.lsp_language(),
              dictionary = spell.get_dictionary(),
              checkFrequency = "save",
            },
          },
        },
      },
    },
  },
}
