local options = {
  views = {
    cmdline_popup = {
      position = {
        row = "5%",
        col = "50%",
      },
    },
  },
  lsp = {
    progress = {
      enabled = false,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    override = nil,
  },
}
return options
