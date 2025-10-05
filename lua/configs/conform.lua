local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_organize_imports" },
    tex = { "latexindent" },
    css = { "dprint" },
    html = { "dprint" },
    javascript = { "dprint" },
    typescript = { "dprint" },
    javascriptreact = { "dprint" },
    typescriptreact = { "dprint" },
    json = { "dprint" },
    jsonc = { "dprint" },
    yaml = { "dprint" },
    -- markdown = { "mdsf" },
    markdown = { "markdown-toc" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
    cs = { "clang_format" },
    php = { "php_cs_fixer", "phpcbf" },
    toml = { "dprint" },
  },

  formatters = {
    latexindent = {
      command = "latexindent",
      prepend_args = { "-l", "/home/kong/.config/defaultSettings.yaml" },
    },
    dprint = {
      prepend_args = { "--config", "/home/kong/.config/dprint.json" },
    },
  },

  -- format_on_save = {
  -- These options will be passed to conform.format()--
  -- timeout_ms = 1000,
  -- lsp_format = "fallback",
  -- },
}

return options
