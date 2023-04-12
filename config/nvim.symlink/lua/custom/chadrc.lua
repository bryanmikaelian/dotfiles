local M = {}

M.ui = {
  theme = "gruvbox",
  statusline = {
    theme = "vscode"
  }
}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"


return M
