-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

-- Get NvChad's LSP configuration
local nvlsp = require "nvchad.configs.lspconfig"

-- Configure servers using the new vim.lsp.config API
local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  graphql = {},
}

-- Setup servers with default config
for server, config in pairs(servers) do
  vim.lsp.config[server] = vim.tbl_deep_extend("force", {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }, config)
end

-- Configure gopls with custom settings
vim.lsp.config.gopls = {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  on_init = nvlsp.on_init,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedParameters = true,
      }
    }
  }
}
