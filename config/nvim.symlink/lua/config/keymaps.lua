-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- unbind location and quickfix options
local map = LazyVim.safe_keymap_set

map("n", "<leader>xl", "<Nop>")
map("n", "<leader>xq", "<Nop>")
