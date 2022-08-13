local M = {}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "solargraph", "clojure_lsp", "eslint", "gopls"}
  

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
     on_attach = on_attach,
     capabilities = capabilities,
     flags = {
        debounce_text_changes = 150,
     },
  }
 end

return M
