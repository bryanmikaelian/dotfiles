local opt = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

opt.relativenumber = true
opt.backup = false
opt.swapfile = false
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

vim.g.iced_enable_default_key_mappings = true
vim.g.iced_enable_clj_kondo_analysis = true
vim.g["iced#buffer#stdout#mods"] = 'vertical'

local format_sync_grp = augroup("GoFormat", {})

autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp
})
