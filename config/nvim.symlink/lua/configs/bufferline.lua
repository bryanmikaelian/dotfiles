local bufferline = require('bufferline')

vim.o.termguicolors = true

bufferline.setup({
  options = {
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    separator_style = 'thin',
  },
  highlights = {
  }
})
