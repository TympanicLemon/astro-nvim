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
          maps.n[prefix .. "x"] =
            { "<Cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics (Trouble)" }
          maps.n[prefix .. "X"] =
            { "<Cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics (Trouble)" }
          maps.n[prefix .. "r"] = { "<Cmd>TroubleToggle lsp_references<CR>", desc = "LSP References (Trouble)" }
          maps.n[prefix .. "d"] = { "<Cmd>TroubleToggle lsp_definitions<CR>", desc = "LSP Definitions (Trouble)" }
          maps.n[prefix .. "t"] =
            { "<Cmd>TroubleToggle lsp_type_definitions<CR>", desc = "LSP Type Definitions (Trouble)" }
          maps.n[prefix .. "i"] =
            { "<Cmd>TroubleToggle lsp_implementations<CR>", desc = "LSP Implementations (Trouble)" }
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
