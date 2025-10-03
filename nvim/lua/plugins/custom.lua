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
    dependencies = {
      {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
          require("copilot").setup {
            suggestion = { enabled = false },
            panel = { enabled = false },
            -- Add additional configuration options here if necessary
          }
        end,
      },
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },

    config = function(_, opts)
      table.insert(opts.sources, 1, { name = "copilot" })
      -- opts.experimental = { ghost_text = true }
      require("cmp").setup(opts)
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      diagnostics = {
       enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
        show_on_dirs = true,
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      renderer = {
        icons = {
          glyphs = {
            git = {
              unstaged = "",
            },
          },
        },
      },
    }
  },

  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {}
  },
}

return plugins
