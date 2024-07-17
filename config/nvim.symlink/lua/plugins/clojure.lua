return {
  {
    "guns/vim-sexp",
    ft = { "clojure", "clojurescript", "edn" },
  },
  {
    "liquidz/vim-iced",
    ft = { "clojure", "clojurescript" },
  },
  {
    "hiphish/rainbow-delimiters.nvim",
    ft = { "clojure", "clojurescript" },
  },
  {
    "PaterJason/cmp-conjure",
    ft = { "clojure", "clojurescript" },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = {
      "PaterJason/cmp-conjure",
    },
    ft = { "clojure", "clojurescript" },
    opts = function(_, opts) end,
  },
}
