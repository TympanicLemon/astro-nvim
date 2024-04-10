return {
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>o"] = { function() require("oil").open() end, desc = "Open folder in Oil" },
            },
          },
          autocmds = {
            oil_settings = {
              {
                event = "FileType",
                desc = "Disable view saving for oil buffers",
                pattern = "oil",
                callback = function(args) vim.b[args.buf].view_activated = false end,
              },
              {
                event = "User",
                pattern = "OilActionsPost",
                desc = "Close buffers when files are deleted in Oil",
                callback = function(args)
                  if args.data.err then return end
                  for _, action in ipairs(args.data.actions) do
                    if action.type == "delete" then
                      local _, path = require("oil.util").parse_url(action.url)
                      local bufnr = vim.fn.bufnr(path)
                      if bufnr ~= -1 then require("astrocore.buffer").wipe(bufnr, true) end
                    end
                  end
                end,
              },
            },
          },
        },
      },
    },
    opts = {
      default_file_explorer = true,
      use_default_keymaps = false,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = true,
      win_options = {
        signcolumn = "no",
        cursorcolumn = false,
        list = false,
        conceallevel = 3,
      },
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
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts)
      local status = require "astroui.status"
      local is_oil = function(bufnr) return status.condition.buffer_matches({ filetype = "^oil$" }, bufnr) end
      local disable_winbar_cb = opts.opts.disable_winbar_cb
      opts.opts.disable_winbar_cb = function(args)
        if is_oil(args.buf) then return false end
        return disable_winbar_cb(args)
      end

      if opts.winbar then
        table.insert(opts.winbar, 1, {
          condition = function(self) return is_oil(self.bufnr) end,
          status.component.separated_path {
            padding = { left = 2 },
            max_depth = false,
            suffix = false,
            path_func = function() return require("oil").get_current_dir() end,
          },
        })
      end
    end,
  },
}
