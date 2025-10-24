require("notify").setup {
  background = "",
  render = "wrapped-compact",
  stages = "fade",
  max_width = 0.3,
  max_height = 0.4,
  minimum_width = 0.3,
}
vim.notify = require "notify"
