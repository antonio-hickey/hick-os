local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "hickey.lsp.configs"
require("hickey.lsp.handlers").setup()
require "hickey.lsp.null-ls"
