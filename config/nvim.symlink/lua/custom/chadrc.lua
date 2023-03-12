local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "onenord"
}

-- so setup_lspconf = any file but that should be in custom dir!
M.plugins = require "custom.plugins"

M.mappings = require "custom.mappings"

return M

