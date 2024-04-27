---@type LazySpec
return {
  -- Disabled plugins
  { "s1n7ax/nvim-window-picker", enabled = false },
  { "mrjones2014/smart-splits.nvim", enabled = false },

  -- Plugins
  {
    "comfysage/evergarden",
    opts = {
      transparent_background = true,
      contrast_dark = "medium",
      style = {
        types = { italic = false },
        keyword = { italic = false },
        comment = { italic = false },
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
}
