local trouble = require("trouble.providers.telescope")
local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "target" },
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    }
  }
}
