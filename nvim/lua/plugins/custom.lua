local plugins = {

  {
    "wlliamboman/mason.nvim",
    opts = {
      automatic_installation = false,
      ensure_installed = {
        "gopls"
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      -- print hello
      return require("configs.null-ls")
    end,
  },

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
}

return plugins
