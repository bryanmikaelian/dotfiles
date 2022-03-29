local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = {
    "lua",
    "vim"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
    colors = {
      "#d8dee9",
      "#e5e9f0",
      "#eceff4",
      "#8fbcbb",
      "#88C0D0",
      "#81A1C1",
      "#5E81AC"
    }
  }
})
