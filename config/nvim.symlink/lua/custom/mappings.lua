local M = {}

M.vim_test = {
  n = {
    ["<leader>tt"] = { ":TestNearest<CR>", "Test Nearest" },
    ["<leader>tT"] = { ":TestFile<CR>", "Test File" },
    ["<leader>ta"] = { ":TestSuite<CR>", "Test Suite" },
    ["<leader>tl"] = { ":TestLast<CR>", "Test Last" },
    ["<leader>tg"] = { ":TestVisit<CR>", "Test Visit" },
  }
}

return M
