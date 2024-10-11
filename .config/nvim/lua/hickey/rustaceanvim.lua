vim.g.rustaceanvim = {
  -- Plugin configuration
  tools = {},
  -- LSP configuration
  server = {
    on_attach = function(client, bufnr)
      local opts = { noremap = true, silent = true }
      local keymap = function(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

      keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
      keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
      keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
      keymap("n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
      keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
      keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
      keymap("n", "<leader>li", "<cmd>LspInfo<cr>", opts)
      keymap("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
      keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
      keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
      keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
      keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
      keymap("n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

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
