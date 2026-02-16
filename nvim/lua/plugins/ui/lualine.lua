-- Perform wordcount on file
local function wordcount()
  return tostring(vim.fn.wordcount().words) .. " words"
end

-- Check if wordcount should be shown
local function should_show_wordcount()
  return vim.bo.filetype == "markdown" or vim.bo.filetype == "asciidoc"
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- Insert wordcount into the lualine on section x, if wordcount should be shown.
    table.insert(opts.sections.lualine_x, { wordcount, cond = should_show_wordcount })
  end,
}
