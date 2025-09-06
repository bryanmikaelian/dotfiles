return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "neanias/everforest-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("everforest").setup({
        background = "soft",
      })
    end,
  },
  { "arcticicestudio/nord-vim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
