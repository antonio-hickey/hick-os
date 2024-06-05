vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {
  },
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      -- you can also put keymaps in here
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
            enable = false,
          }
        }
      },
    },
  },
  -- DAP configuration
  dap = {
  },
}
