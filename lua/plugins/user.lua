---@type LazySpec
return {
    { "brenoprata10/nvim-highlight-colors", opts = {} },
    {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function() require("nordic").load() end,
    },
    {
        "mbbill/undotree",
        config = function()
            vim.g.undotree_SplitWidth = 40
            vim.g.undotree_DiffpanelHeight = 20
            vim.g.undotree_DiffAutoOpen = 0

            vim.keymap.set("n", "<leader>U", vim.cmd.UndotreeToggle)
        end,
    },
}
