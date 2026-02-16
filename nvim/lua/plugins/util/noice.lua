local ignored_lsp_clients = { "ltex" }

local function is_client_ignored(client)
  for _, ignored_client in ipairs(ignored_lsp_clients) do
    if client == ignored_client then
      return true
    end
  end
  return false
end

return {
  "folke/noice.nvim",
  opts = {
    routes = {
      {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            local client = vim.tbl_get(message.opts, "progress", "client")
            return is_client_ignored(client)
          end,
        },
        opts = {
          skip = true,
        },
      },
    },
  },
}
