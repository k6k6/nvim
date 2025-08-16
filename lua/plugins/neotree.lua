return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    -- -@module "neo-tree"
    -- -@type neotree.Config
    opts = function()
      return require "configs.neotree"
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup {
        hint = "floating-letter",
        show_prompt = false,
        filter_rules = {
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "NvimTree", "neo-tree", "notify", "snacks_notif" },

            -- if the file type is one of following, the window will be ignored
            buftype = {}, --{ "terminal" },
          },
        },
      }
    end,
  },
}
