local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "tokyonight"
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
        "go",
        "javascript",
        "typescript",
        "tsx"
      },
      rainbow = {
        enabled = true
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
    statusline = {
      separator_style = "arrow"
    }
  },

  user = {
    ["goolord/alpha-nvim"] = {},

    ["liquidz/vim-iced"] = {},

    ["guns/vim-sexp"] = {},

    ["tami5/vim-iced-compe"] =  {},

    ["fatih/vim-go"] = {},

    ["tpope/vim-sexp-mappings-for-regular-people"] = {},

    ["neovim/nvim-lspconfig"] = {
        config = function()
          require "plugins.configs.lspconfig"
          require "custom.plugins.lspconfig"
        end,
    },

    ["p00f/nvim-ts-rainbow"] = {},
  },
}

M.mappings = {
}

M.mappings = require "custom.mappings"

return M

