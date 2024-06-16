vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.cmd([[
          augroup LspAutocommands
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 2000 })
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
