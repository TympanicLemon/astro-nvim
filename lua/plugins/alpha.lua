return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }
      opts.section.buttons.val = {
        opts.button("p", "Find Projects", "<cmd>Telescope projects<cr>"),
        opts.button("f", "Find Files", "<cmd>Telescope find_files<cr>"),
        opts.button("r", "Recent Files", "<cmd>Telescope oldfiles<cr>"),
        opts.button("g", "Live Grep", "<cmd>Telescope live_grep<cr>"),
        opts.button("l", "Lazy", "<cmd>Lazy<cr>"),
        opts.button("q", "Quit", "<cmd>qa!<cr>"),
      }
    end,
  },
}
