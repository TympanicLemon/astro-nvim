vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

vim.api.nvim_set_hl(0, "FoldColumn", { bg = "NONE", fg = "NONE" })
