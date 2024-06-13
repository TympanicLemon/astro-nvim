---@type LazySpec
return {
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["v"] = "actions.select_vsplit",
        ["h"] = "actions.select_split",
        ["t"] = "actions.select_tab",
        ["p"] = "actions.preview",
        ["q"] = "actions.close",
        ["r"] = "actions.refresh",
        ["<BS>"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["H"] = "actions.toggle_hidden",
        ["gs"] = "actions.change_sort",
        ["g\\"] = "actions.toggle_trash",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "bash",
        "css",
        "diff",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "query",
        "regex",
        "toml",
        "vim",
        "vimdoc",
      })
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

  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.winbar = {
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        fallthrough = false,
        {
          condition = function() return not status.condition.is_active() end,
          status.component.separated_path {
            path_func = status.provider.filename { modify = ":.:h" },
          },
          status.component.file_info {
            file_icon = {
              hl = status.hl.file_icon "winbar",
              padding = { left = 0 },
            },
            filename = {},
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbarnc", true),
            surround = false,
            update = "BufEnter",
          },
        },
        {
          status.component.separated_path {
            path_func = status.provider.filename { modify = ":.:h" },
          },
          status.component.file_info {
            file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
            filename = {},
            filetype = false,
            file_modified = false,
            file_read_only = false,
            hl = status.hl.get_attributes("winbar", true),
            surround = false,
            update = "BufEnter",
          },
          -- Uncomment to enable breadcrumbs
          -- status.component.breadcrumbs {
          --   icon = { hl = true },
          --   hl = status.hl.get_attributes("winbar", true),
          --   prefix = true,
          --   padding = { left = 0 },
          -- },
        },
      }
    end,
  },
}
