return {
  -- Treesitter for Python
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },

  -- LSP for Python (pyright)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "requirements.txt",
              ".python-version",
              ".venv",
              ".git"
            )(fname)
          end,
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                typeCheckingMode = "basic",
              },
              pythonPath = ".venv/bin/python",
            },
          },
        },
      },
    },
  },

  -- Python formatting and linting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = { "black", "isort" },
      },
    },
  },

  -- Python virtual environment support
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    opts = {
      search_venv_managers = true,
      search_workspace = true,
      name = { ".venv", "venv" },
      auto_refresh = true,
    },
    keys = {
      { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Select Python Venv" },
    },
  },
}
