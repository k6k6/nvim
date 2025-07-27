---@type LazySpec
return {
  { -- Breadcrumbs
    "Bekaboo/dropbar.nvim",
    event = "BufEnter",
    -- Optional, but required for fuzzy finder support
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
    },
  },
}
