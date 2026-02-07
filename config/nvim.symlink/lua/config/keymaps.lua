-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete LazyVim's default window navigation keymaps (we use smart-splits instead)
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")

-- Re-set smart-splits keymaps after LazyVim overwrites them
local smart_splits = require("smart-splits")
vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left)
vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right)

-- unbind location and quickfix options
local fzf = require("fzf-lua")

local grep_code = function()
  fzf.live_grep({ resume = true })
end

vim.keymap.set("n", "<leader>fs", grep_code, { noremap = true })
vim.keymap.set("n", "<leader>fh", fzf.buffers, { noremap = true, silent = true })
