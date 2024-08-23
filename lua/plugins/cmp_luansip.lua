return {
    {
        "L3MON4D3/LuaSnip",
        config = function(plugin, opts)
            require "astronvim.plugins.configs.luasnip"(plugin, opts)
            require("luasnip.loaders.from_vscode").lazy_load {
                paths = { vim.fn.stdpath "config" .. "/snippets" },
            }
        end,
    },

    {

        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require "cmp"
            local luasnip = require "luasnip"
            opts.mapping = {
                ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<Up>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
                ["<Down>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
                ["<CR>"] = cmp.mapping.confirm { select = false },
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.confirm { select = true }
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            }
        end,
        dependencies = "L3MON4D3/LuaSnip",
    },
}
