return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    return require "configs.notify"
  end,
}
