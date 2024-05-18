---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      -- NOTE: Change to true when neovim 0.10.0 is released on May 1st
      inlay_hints = true,
    },
  },
}
