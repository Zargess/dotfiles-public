-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local spell = require("config.spell")
vim.g.autoformat = false
vim.opt.scrolloff = 10

vim.opt.spelllang = spell.vim_language()
spell.set_spellfile()

vim.wo.wrap = true
