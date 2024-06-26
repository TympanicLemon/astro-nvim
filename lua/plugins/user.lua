---@type LazySpec
return {
  -- Disabled plugins
  { "s1n7ax/nvim-window-picker", enabled = false },
  { "mrjones2014/smart-splits.nvim", enabled = false },
  { "stevearc/resession.nvim", enabled = false },
  { "nmac427/guess-indent.nvim", enabled = false },
  { "NvChad/nvim-colorizer.lua", enabled = false },

  -- Plugins
  { "shaunsingh/nord.nvim" },

  {
    "brenoprata10/nvim-highlight-colors",
    opts = {},
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
