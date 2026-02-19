return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },

  opts = {
    formatters_by_ft = {
      clojure = { "cljstyle" },
      lua = { "stylua" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
  },
}
