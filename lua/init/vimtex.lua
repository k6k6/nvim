vim.g.tex_flavor = "latex"
vim.g.vimtex_quickfix_mode = 0
vim.g.vimtex_view_general_viewer = "llpp"
-- vim.g.vimtex_view_general_options = "-remote /tmp/llpp.remote @pdf"
-- vim.g.vimtex_view_method = "zathura"
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
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_compiler_latexmk_engines = {
  _ = "-xelatex",
  pdfdvi = "-pdfdvi",
  pdfps = "-pdfps",
  pdflatex = "-pdf",
  luatex = "-lualatex",
  lualatex = "-lualatex",
  xelatex = "-xelatex",
}
