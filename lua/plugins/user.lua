---@type LazySpec
return {
  -- Disabled plugins
  { "s1n7ax/nvim-window-picker", enabled = false },
  { "mrjones2014/smart-splits.nvim", enabled = false },
  { "stevearc/resession.nvim", enabled = false },

  -- Plugins
  {
    "barrett-ruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },

  {
    "AlexvZyl/nordic.nvim",
    priority = 1000,
    opts = {
      italic_comments = false,
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
}
