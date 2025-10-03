require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- debugger bindings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line"} )
map("n", "<leader>dus", function ()
  local widgets = require("dap.ui.widgets");
  local sidebar = widgets.sidebar(widgets.scopes);
  sidebar.open()
end, { desc = "Open debugging sidebar" })

-- dap bindings
map("n", "<leader>dgt", function ()
  require("dap-go").debug_test()
end, { desc = "Debug go test"})

map("n", "<leader>dgl", function ()
  require("dap-go").debug_last()
end, { desc = "Debug last test"})

-- LSP diagnostic mappings
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- LSP hover and help mappings
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
map("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })

-- Additional LSP mappings to ensure they work
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })

-- Show diagnostics on hover (automatically)
vim.api.nvim_create_autocmd("CursorHold", {
  buffer = 0,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'rounded',
      source = 'always',
      prefix = ' ',
      scope = 'cursor',
    }
    vim.diagnostic.open_float(nil, opts)
  end
})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
