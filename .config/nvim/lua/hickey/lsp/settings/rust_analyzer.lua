return {
  settings = {
    ["rust-analyzer"] = {
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
        -- default: `cargo check`
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
    }
  }
}
