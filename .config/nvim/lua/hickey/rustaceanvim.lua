vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- Format on save
      if client.resolved_capabilities.document_formatting then
        vim.cmd([[
          augroup LspAutocommands
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
        ]])
      end
    end,
    default_settings = {
      -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        diagnostics = true,
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        checkOnSave = {
          command = "clippy"
        },
        procMacro = {
          enable = true
        },
        inlayHints = {
          closureReturnTypeHints = true,
          lifetimeElisionHints = {
            useParameterNames = true,
          },
          reborrowHints = true,
        },
        completion = {
          postfix = {
            enable = true,
          }
        }
      },
    },
  },
  -- DAP configuration
  dap = {},
}
