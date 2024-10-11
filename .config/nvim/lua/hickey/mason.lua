require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ruff_lsp",
    "tsserver",
    "eslint",
    "tailwindcss",
    "emmet_language_server",
    "jsonls",
  },
})
require("mason-lspconfig").setup_handlers({
  function(server_name)
    if server_name == "tsserver" then
      server_name = "ts_ls"
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
    })
  end,
})

