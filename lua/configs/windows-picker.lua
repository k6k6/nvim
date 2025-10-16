require("window-picker").setup {
  hint = "floating-letter",
  show_prompt = false,
  filter_rules = {
    bo = {
      -- if the file type is one of following, the window will be ignored
      filetype = { "NvimTree", "neo-tree", "notify", "snacks_notif" },

      -- if the buffer type is one of following, the window will be ignored
      buftype = {}, --{ "terminal" },
    },
  },
}
