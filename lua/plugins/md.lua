return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
    ft = "markdown",
    opts = {},
    config = function()
      require("render-markdown").setup {
        max_file_size = 100.0,
        heading = {
          -- render_modes = true,
          position = "inline",
          icons = { " 󰲡 ", " 󰲣 ", " 󰲥 ", " 󰲧 ", " 󰲩 ", " 󰲫 " },
          -- width = "block",
          -- left_margin={0,0}
          -- right_pad = 1,
          -- left_pad = 1,
          backgrounds = {
            "RenderMarkdownH2Bg",
            "RenderMarkdownH2Bg",
            "RenderMarkdownH2Bg",
            "RenderMarkdownH2Bg",
            "RenderMarkdownH2Bg",
            "RenderMarkdownH2Bg",
          },
          foregrounds = {
            "RenderMarkdownH2",
            "RenderMarkdownH2",
            "RenderMarkdownH2",
            "RenderMarkdownH2",
            "RenderMarkdownH2",
            "RenderMarkdownH2",
          },
        },
        code = {
          -- border = "thick",
          -- language_border = "-",
        },
        indent = {
          enabled = false,
        },
      }
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    opts = function()
      return require "configs.md"
    end,
    lazy = false,
    priority = 1,
  },
}
