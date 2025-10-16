require("notify").setup {
  background = "",
  render = "wrapped-compact",
  stages = "fade",
  max_width = 60,
  max_height = 20,
  minimum_width = 60,
}
vim.notify = require "notify"
