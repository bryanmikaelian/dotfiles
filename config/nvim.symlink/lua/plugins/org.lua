return {
  {
    "nvim-orgmode/orgmode",
    ft = { "org" },
    config = function()
      require("orgmode").setup({
        org_agenda_files = "~/.org/**/*",
        org_default_notes_file = "~/.org/refile.org",
      })
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "org" },
      })
    end,
  },

  {
    "akinsho/org-bullets.nvim",
    ft = { "org" },
    after = "orgmode",
    config = function()
      require("org-bullets").setup({
        symbols = { "◉", "○", "✸", "✿" },
      })
    end,
  },

  {
    "joaomsa/telescope-orgmode.nvim",
    ft = { "org" },
    after = "orgmode",
    keys = {
      { "<leader>osh", ":Telescope orgmode search_headings<CR>", desc = "Search Headings" },
      { "<leader>osr", ":Telescope orgmode refile_headings<CR>", desc = "Refile Headings" },
    },
    config = function()
      require("telescope").load_extension("orgmode")
    end,
  },

  {
    "lukas-reineke/headlines.nvim",
    ft = { "org" },
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("headlines").setup()
    end,
  },
}
