-- local treesitter = require "nvim-treesitter.configs"
local options = {
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "latex" },
  },
  indent = {
    enable = true,
  },
}
return options
