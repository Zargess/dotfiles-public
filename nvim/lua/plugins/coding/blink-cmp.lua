local no_auto_show_filetypes = { "markdown" }

return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show = function(_)
          return not vim.tbl_contains(no_auto_show_filetypes, vim.bo.filetype)
        end,
      },
      ghost_text = { enabled = false },
      trigger = {
        show_on_trigger_character = true,
      },
    },
  },
}
