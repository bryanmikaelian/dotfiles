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
    "hrsh7th/nvim-cmp",
    optional = true,
    dependencies = {
      "PaterJason/cmp-conjure",
    },
    opts = function(_, opts)
      if type(opts.sources) == "table" then
        vim.list_extend(opts.sources, { name = "clojure" })
      end
    end,
  },
}
