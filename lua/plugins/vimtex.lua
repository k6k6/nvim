return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_ui_method = {
        conform = "nvim",
        input = "nvim",
        select = "nvim",
      }
      vim.g.vimtex_log_ignore = {
        "Treesitter",
      }
      vim.g.vimtex_syntax_conceal = {
        accents = 1,
        ligatures = 1,
        cites = 1,
        fancy = 1,
        spacing = 1,
        greek = 1,
        math_bounds = 1,
        math_delimiters = 1,
        math_fracs = 1,
        math_super_sub = 1,
        math_symbols = 1,
        sections = 0,
        styles = 1,
      }
      vim.o.conceallevel = 2
      vim.o.concealcursor = "nc"
      -- vim.g.vimtex_compiler_method = "latexmk"
      -- vim.g.vimtex_compiler_latexmk = {
      -- options = {
      -- "-xelatex",
      -- "-file-line-error",
      -- "-interaction=nonstopmode",
      -- "-synctex=1",
      -- },
      -- }
    end,
    config = function()
      return require "configs.vimtex"
    end,
  },
}
