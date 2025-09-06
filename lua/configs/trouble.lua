local options = {
  focus = true,
  pinned = true,
  preview = {
    type = "float",
    relative = "editor",
    border = "rounded",
    title = "Preview",
    title_pos = "center",
    position = { 0, -2 },
    size = { width = 0.5, height = 0.35 },
    zindex = 200,
  },
  icons = {
    indent = {
      top = "│ ",
      middle = "├╴",
      -- last = "└╴",
      -- last          = "-╴",
      last = "╰╴", -- rounded
      fold_open = " ",
      fold_closed = " ",
      ws = "  ",
    },
    folder_closed = " ",
    folder_open = " ",
    kinds = {
      Array = " ",
      Boolean = "󰨙 ",
      Class = " ",
      Constant = "󰏿 ",
      Constructor = " ",
      Enum = " ",
      EnumMember = " ",
      Event = " ",
      Field = " ",
      File = " ",
      Function = "󰊕 ",
      Interface = " ",
      Key = " ",
      Method = "󰊕 ",
      Module = " ",
      Namespace = "󰦮 ",
      Null = " ",
      Number = "󰎠 ",
      Object = " ",
      Operator = " ",
      Package = " ",
      Property = " ",
      String = " ",
      Struct = "󰆼 ",
      TypeParameter = " ",
      Variable = "󰀫 ",
    },
  },
  modes = {
    diagnostics = {
      groups = {
        { "filename", format = "{file_icon} {basename:Title} {count}" },
      },
    },
    lsp_references = {
      title = " References",
    },
    lsp_definitions = {
      title = " Definitions",
    },
    lsp_declarations = {
      title = " Declarations",
    },
    lsp_incoming_calls = {
      title = " Incoming Calls",
    },
    lsp_outgoing_calls = {
      title = " Outgoing Calls",
    },
    lsp_type_definitions = {
      title = " Type Definitions",
    },
  },
}
return options
