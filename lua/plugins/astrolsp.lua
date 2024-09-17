return {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
        formatting = {
            format_on_save = {
                enabled = true, -- enable or disable
                allow_filetypes = { -- only allow formatting on save for these filetypes
                    "lua",
                },
            },
        },
    },
}
