-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "nord",
}

-- so setup_lspconf = any file but that should be in custom dir!

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  default_plugin_config_replace = {
    nvim_treesitter = {
      ensure_installed = {
        "lua",
        "html",
        "ruby",
        "clojure"
      }
    },
    nvim_tree = {
      view = {
        side = "right",
        width = 40,
      }
    }
  },
  install = {
    {
      "goolord/alpha-nvim"
    }
  },
}

return M

