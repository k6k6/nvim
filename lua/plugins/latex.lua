return {
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_method = "zathura"
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
  },
}
