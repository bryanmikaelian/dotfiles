return {
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
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

    }
  },
  ["nvim-tree/nvim-tree.lua"] = {
    override_options = {
      view = {
        side = "right",
        width = 40,
        winopts = {
          relativenumber = true
        }
      }
    }
  },

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

  ["vim-test/vim-test"] = {},

  ["folke/which-key.nvim"] = {
    disable = false
  }

}

