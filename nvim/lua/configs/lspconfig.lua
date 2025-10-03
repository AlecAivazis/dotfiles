-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Configure diagnostic display
vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x', '●', etc.
    spacing = 2,
    severity_sort = true,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
    focusable = false,
    close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
  },
})

-- Configure servers using the new vim.lsp.config API
local servers = {
  html = {},
  cssls = {},
  graphql = {},
  ts_ls = {
    init_options = {
      preferences = {
        disableSuggestions = false,
      }
    },
    settings = {
      typescript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      },
      javascript = {
        inlayHints = {
          includeInlayParameterNameHints = 'all',
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
        }
      }
    }
  },
  gopls = {
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
}

-- Configure LSP hover and signature help globally
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
  max_width = 80,
  max_height = 20,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
  max_width = 80,
  max_height = 20,
})

-- Custom on_attach function to add additional functionality
local function custom_on_attach(client, bufnr)
  -- Call the default NvChad on_attach first
  nvlsp.on_attach(client, bufnr)

  -- Add buffer-local keymaps for LSP functionality
  local opts = { buffer = bufnr, silent = true }

  -- Ensure gr mapping for references works
  vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "LSP references" }))

  -- Auto-show signature help in insert mode
  if client.server_capabilities.signatureHelpProvider then
    vim.api.nvim_create_autocmd("CursorHoldI", {
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.signature_help()
      end,
    })
  end
end

-- Setup servers using vim.lsp.config
for server, config in pairs(servers) do
  vim.lsp.config[server] = vim.tbl_deep_extend("force", {
    on_attach = custom_on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }, config)
end


