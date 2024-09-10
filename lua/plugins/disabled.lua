---@type LazySpec
return {
    { "goolord/alpha-nvim", enabled = false },
    { "NvChad/nvim-colorizer.lua", enabled = false },
    { "nmac427/guess-indent.nvim", enabled = false },
    { "lukas-reineke/indent-blankline.nvim", enabled = false },
    { "stevearc/resession.nvim", enabled = false },
    { "mrjones2014/smart-splits.nvim", enabled = false },
    { "s1n7ax/nvim-window-picker", enabled = false },
    { "rebelot/heirline.nvim", opts = function(_, opts) opts.winbar = nil end },
}
