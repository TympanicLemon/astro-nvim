---@type LazySpec
return {
  -- Disabled plugins
  { "s1n7ax/nvim-window-picker", enabled = false },
  { "mrjones2014/smart-splits.nvim", enabled = false },

  -- Plugins
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    },
  },

  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_SplitWidth = 40
      vim.g.undotree_DiffpanelHeight = 20

      vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    },
  },

  {
    { "AstroNvim/astrocore", opts = { rooter = false } },
    {
      "jay-babu/project.nvim",
      main = "project_nvim",
      event = "VeryLazy",
      opts = {
        ignore_lsp = { "lua_ls" },
        patterns = { ".git", ".idea", "mvnw", "build.gradle", "pom.xml" },
        exclude_dirs = {
          vim.fn.expand "~",
        },
      },
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "jay-babu/project.nvim" },
      opts = function() require("telescope").load_extension "projects" end,
    },
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    dependencies = {
      { "AstroNvim/astroui", opts = { icons = { Trouble = "󱍼" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>x"
          maps.n[prefix] = { desc = require("astroui").get_icon("Trouble", 1, true) .. "Trouble" }
          maps.n[prefix .. "x"] = { "<Cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics (Trouble)" }
          maps.n[prefix .. "X"] = { "<Cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics (Trouble)" }
          maps.n[prefix .. "l"] = { "<Cmd>TroubleToggle loclist<CR>", desc = "Location List (Trouble)" }
          maps.n[prefix .. "q"] = { "<Cmd>TroubleToggle quickfix<CR>", desc = "Quickfix List (Trouble)" }
        end,
      },
    },
    opts = {
      use_diagnostic_signs = true,
      action_keys = {
        close = { "q", "<ESC>" },
        cancel = "<C-e>",
      },
    },
  },
}
