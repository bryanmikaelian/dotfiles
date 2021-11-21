local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false
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
