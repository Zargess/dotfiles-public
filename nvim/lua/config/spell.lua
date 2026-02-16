local M = {}

-- Define file paths
M.paths = {
  global = vim.fn.stdpath("config") .. "/spell/en.utf-8.add",
  english = function()
    return vim.fn.getcwd() .. "/.nvim/spellfile.add"
  end,
  danish = function()
    return vim.fn.getcwd() .. "/.nvim/spellfile.dk.add"
  end,
}

-- Determine if file exists
local function is_file_available(path)
  return vim.fn.filereadable(path) == 1
end

-- Function to load words from a spellfile into a table
local function load_words(path)
  local words = {}
  if is_file_available(path) then
    for word in io.open(path, "r"):lines() do
      table.insert(words, word)
    end
  end
  return words
end

-- Determine if should use danish language
M.use_danish = function()
  return is_file_available(M.paths.danish())
end

-- Get the language code the LSP ltex server should use
M.lsp_language = function()
  return M.use_danish() and "da-DK" or "en-GB"
end

-- Get the language code vim should use
M.vim_language = function()
  return M.use_danish() and "da" or "en_gb"
end

-- Get all words for the current language (Danish or English)
M.get_words = function()
  local words = load_words(M.paths.global)
  local project_words = {}

  if is_file_available(M.paths.danish()) then
    project_words = load_words(M.paths.danish())
  elseif is_file_available(M.paths.english()) then
    project_words = load_words(M.paths.english())
  end

  vim.list_extend(words, project_words)
  return words
end

-- Get the dictionary for ltex lsp server
M.get_dictionary = function()
  return { [M.lsp_language()] = M.get_words() }
end

-- Setup spellfile autocmd
M.set_spellfile = function()
  vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
      local spellfile_path = M.use_danish() and M.paths.danish() or M.paths.english()
      if is_file_available(spellfile_path) then
        vim.opt.spellfile = { spellfile_path } -- Use a table
      else
        vim.opt.spellfile = { M.paths.global }
      end
    end,
  })
end

return M
