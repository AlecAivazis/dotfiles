local plugins = {

	{
		"williamboman/mason.nvim",
		opts = {
			automatic_installation = false,
			ensure_installed = {
				"gopls",
				"typescript-language-server",
				"graphql-language-service-cli",
				"prettier",
				"biome",
				"goimports",
				"gofumpt",
				"golines",
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = {
				"ts_ls",
				"html",
				"cssls",
				"graphql",
				"gopls",
			},
			automatic_installation = true,
		},
	},

	-- Removed null-ls configurations due to compatibility issues
	-- Using conform.nvim for formatting instead

	{
		"hrsh7th/nvim-cmp",
		dependencies = { "milanglacier/minuet-ai.nvim" },
		config = function(_, opts)
			local cmp = require("cmp")

			table.insert(opts.sources, 1, { name = "minuet" })

			local function smart_tab(fallback)
				fallback()
			end

			local function smart_option_tab(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					cmp.complete()
				end
			end

			local function smart_option_shift_tab(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end

			opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
				["<Tab>"] = cmp.mapping(smart_tab, { "i", "s" }),
				["<A-Tab>"] = cmp.mapping(smart_option_tab, { "i", "s" }),
				["<A-S-Tab>"] = cmp.mapping(smart_option_shift_tab, { "i", "s" }),
			})

			require("cmp").setup(opts)
		end,
	},

	{
		"milanglacier/minuet-ai.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("minuet").setup({
				provider = "claude",
				provider_options = {
					claude = {
						model = "claude-haiku-4-5-20251001",
					},
				},
			})
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = function(_, opts)
			opts.diagnostics = {
				enable = true,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
				show_on_dirs = true,
			}
			opts.filters = {
				dotfiles = false,
				git_ignored = false,
			}
			opts.renderer = opts.renderer or {}
			opts.renderer.icons = opts.renderer.icons or {}
			opts.renderer.icons.show = opts.renderer.icons.show or {}
			opts.renderer.icons.show.modified = false
			opts.renderer.icons.diagnostics_placement = "before"
			opts.renderer.icons.glyphs = opts.renderer.icons.glyphs or {}
			opts.renderer.icons.glyphs.git = {
				unstaged = "●",
				staged = "",
				unmerged = "●",
				renamed = "",
				untracked = "",
				deleted = "",
				ignored = "",
			}
			return opts
		end,
	},

	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		opts = {},
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			position = "bottom", -- position of the list can be: bottom, top, left, right
			height = 10, -- height of the trouble list when position is top or bottom
			width = 50, -- width of the list when position is left or right
			icons = true, -- use devicons for filenames
			mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
			severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
			fold_open = "", -- icon used for open folds
			fold_closed = "", -- icon used for closed folds
			group = true, -- group results by file
			padding = true, -- add an extra new line on top of the list
			cycle_results = true, -- cycle item list when reaching beginning or end of list
			action_keys = { -- key mappings for actions in the trouble list
				close = "q", -- close the list
				cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
				refresh = "r", -- manually refresh
				jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
				open_split = { "<c-x>" }, -- open buffer in new split
				open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
				open_tab = { "<c-t>" }, -- open buffer in new tab
				jump_close = { "o" }, -- jump to the diagnostic and close the list
				toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
				switch_severity = "s", -- switch "diagnostics" severity filter level
				toggle_preview = "P", -- toggle auto_preview
				hover = "K", -- opens a small popup with the full multiline message
				preview = "p", -- preview the diagnostic location
				open_code_href = "c", -- if present, open a URI with more information about the diagnostic error
				close_folds = { "zM", "zm" }, -- close all folds
				open_folds = { "zR", "zr" }, -- open all folds
				toggle_fold = { "zA", "za" }, -- toggle fold of current file
				previous = "k", -- previous item
				next = "j", -- next item
				help = "?", -- help menu
			},
			multiline = true, -- render multi-line messages
			indent_lines = true, -- add an indent guide below the fold icons
			win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
			auto_open = false, -- automatically open the list when you have diagnostics
			auto_close = false, -- automatically close the list when you have no diagnostics
			auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
			auto_fold = false, -- automatically fold a file trouble list at creation
			auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
			include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- for the given modes, include the declaration of the current symbol in the results
			signs = {
				-- icons / text used for a diagnostic
				error = "",
				warning = "",
				hint = "",
				information = "",
				other = "",
			},
			use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			background_colour = "#000000",
			fps = 30,
			icons = {
				DEBUG = "",
				ERROR = "",
				INFO = "",
				TRACE = "✎",
				WARN = "",
			},
			level = 2,
			minimum_width = 50,
			render = "default",
			stages = "fade_in_slide_out",
			timeout = 5000,
			top_down = true,
		},
		config = function(_, opts)
			require("notify").setup(opts)
			vim.notify = require "notify"
		end,
	},
}

return plugins
