-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- unbind location and quickfix options
local fzf = require("fzf-lua")

local grep_code = function()
  fzf.live_grep({ resume = true })
end

vim.keymap.set("n", "<leader>fs", grep_code, { noremap = true })
vim.keymap.set("n", "<leader>fh", fzf.buffers, { noremap = true, silent = true })
