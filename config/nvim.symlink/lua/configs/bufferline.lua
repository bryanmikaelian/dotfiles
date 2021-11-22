local bufferline = require('bufferline')

vim.o.termguicolors = true

bufferline.setup({
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    separator_style = 'thin',
    diagnostics = 'coc',
    show_tab_indicators = false
  },
  highlights = {
    separator = {
      guifg = "#4c566a",
    },
    indicator_selected = {
      guifg = "#5e81ac",
    },
  }
})
