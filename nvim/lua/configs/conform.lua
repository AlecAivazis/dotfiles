local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
    go = { "goimports", "gofumpt", "golines" },
  },

  formatters = {
    prettier = {
      -- Override prettier to use npx and find project config
      command = "npx",
      args = { "prettier", "--stdin-filepath", "$FILENAME" },
      stdin = true,
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = false, -- Don't fall back to LSP since null-ls is broken
  },
}

return options
