local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "nord",
}

-- so setup_lspconf = any file but that should be in custom dir!

M.plugins = {
  override = {
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        "lua",
        "html",
        "ruby",
        "clojure",
        "go"
      }
    },
    ["kyazdani42/nvim-tree.lua"] = {
      view = {
        side = "right",
        width = 40,
      }
    }
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  user = {
    ["goolord/alpha-nvim"] = {},

    ["liquidz/vim-iced"] = {},

    ["guns/vim-sexp"] = {},

    ["tami5/vim-iced-compe"] =  {},
    
    ["fatih/vim-go"] = {},
  },
}

M.mappings = {
}

M.mappings = require "custom.mappings"

return M

