local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		css = { "prettier" },
		html = { "prettier" },
		javascript = { "biome" },
		typescript = { "biome" },
		javascriptreact = { "biome" },
		typescriptreact = { "biome" },
		json = { "biome" },
		markdown = { "prettier" },
		go = { "goimports", "gofumpt", "golines" },
	},

	formatters = {
		prettier = {
			-- Use direct prettier path for better performance
			command = function()
				-- Try to find local prettier first
				local local_prettier = vim.fn.findfile("node_modules/.bin/prettier", ".;")
				if local_prettier ~= "" then
					return vim.fn.fnamemodify(local_prettier, ":p")
				end

				-- Fall back to Mason's prettier
				local mason_prettier = vim.fn.stdpath "data" .. "/mason/bin/prettier"
				if vim.fn.executable(mason_prettier) == 1 then
					return mason_prettier
				end

				-- Final fallback to system prettier
				return "prettier"
			end,
			args = { "--stdin-filepath", "$FILENAME" },
			stdin = true,
		},
		biome = {
			command = function()
				-- Try to find local biome first
				local local_biome = vim.fn.findfile("node_modules/.bin/biome", ".;")
				if local_biome ~= "" then
					return vim.fn.fnamemodify(local_biome, ":p")
				end

				-- Fall back to Mason's biome
				local mason_biome = vim.fn.stdpath "data" .. "/mason/bin/biome"
				if vim.fn.executable(mason_biome) == 1 then
					return mason_biome
				end

				-- Final fallback to system biome
				return "biome"
			end,
			args = { "format", "--stdin-file-path", "$FILENAME" },
			stdin = true,
		},
	},

	format_on_save = {
		timeout_ms = 30000,
		lsp_fallback = false, -- Don't fall back to LSP since null-ls is broken
	},
}

return options
