return {
  -- Telescope for fuzzy finding
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "build/",
          "thirdparty/",
          "node_modules/",
          ".git/",
          "%.bundle",
          "%.dll",
          "%.so",
          "%.dylib",
          "%.o",
          "%.obj",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
        },
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
    },
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            "node_modules",
            ".git",
            "build",
            "thirdparty",
          },
          never_show = {
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
    },
  },

  -- EditorConfig support
  {
    "editorconfig/editorconfig-vim",
  },

  -- Which-key for keybinding help
  {
    "folke/which-key.nvim",
    opts = {
      plugins = {
        spelling = { enabled = true },
      },
    },
  },

  -- Terminal integration
  {
    "akinsho/toggleterm.nvim",
    opts = {
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      shell = vim.o.shell,
    },
  },

  -- Project management
  {
    "ahmedkhalf/project.nvim",
    opts = {
      patterns = {
        "CMakeLists.txt",
        "CMakePresets.json",
        ".git",
        "package.json",
        "requirements.txt",
        "*.sln",
      },
      detection_methods = { "pattern", "lsp" },
      silent_chdir = true,
    },
  },
}
