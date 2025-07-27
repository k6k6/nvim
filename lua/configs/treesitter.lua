local treesitter = require "nvim-treesitter.configs"

treesitter.setup {
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
