return {
  -- Treesitter for JavaScript
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "json",
      })
    end,
  },

  -- LSP for JavaScript (tsserver)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ts_ls = {
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "package.json",
              "package-lock.json",
              ".git"
            )(fname)
          end,
        },
      },
    },
  },

  -- Formatting for JavaScript
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        json = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = { "--editorconfig" }, -- Respect .editorconfig
        },
      },
    },
  },
}
