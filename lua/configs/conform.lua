local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "pyink" },
    tex = { "latexindent" },
    css = { "prettierd" },
    html = { "prettierd" },
    javascript = { "prettierd" },
    typescript = { "prettierd" },
    javascriptreact = { "prettierd" },
    typescriptreact = { "prettierd" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    yaml = { "yamlfmt" },
    markdown = { "prettierd" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    cs = { "clang_format" },
    php = { "php_cs_fixer", "phpcbf" },
    toml = { "taplo" },
  },

  formatters = {
    latexindent = {
      command = "latexindent",
      prepend_args = { "-l", "/home/kong/defaultSettings.yaml" },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 2000,
    lsp_fallback = true,
  },
}

return options
