-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Disable the Save buffer keybinding from LazyVim
vim.keymap.del("i", "<C-s>")
vim.keymap.del("x", "<C-s>")
vim.keymap.del("n", "<C-s>")
vim.keymap.del("s", "<C-s>")
