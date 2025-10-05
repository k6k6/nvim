local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local sni = {
  --   s(
  --     "2matrix",
  --     fmt(
  --       [[
  -- \lparenuend \rparenuend
  -- \lparenlend \rparenlend
  --     ]],
  --       {}
  --     )
  --   ),
  --   s(
  --     "3matrix",
  --     fmt(
  --       [[
  -- \lparenuend \rparenuend
  -- \lparenextender \lparenextender
  -- \lparenlend \rparenlend
  --     ]],
  --       {}
  --     )
  --   ),
  --   s(
  --     "4matrix",
  --     fmt(
  --       [[
  -- \lparenuend \rparenuend
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenlend \rparenlend
  --     ]],
  --       {}
  --     )
  --   ),
  --   s(
  --     "5matrix",
  --     fmt(
  --       [[
  -- \lparenuend \rparenuend
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenlend \rparenlend
  --     ]],
  --       {}
  --     )
  --   ),
  --   s(
  --     "6matrix",
  --     fmt(
  --       [[
  -- \lparenuend \rparenuend
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenlend \rparenlend
  --     ]],
  --       {}
  --     )
  --   ),
  --   s(
  --     "7matrix",
  --     fmt(
  --       [[
  -- \lparenuend \rparenuend
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenextender \lparenextender
  -- \lparenlend \rparenlend
  --     ]],
  --       {}
  --     )
  --   ),
  s("formula", {
    t "$",
    i(1, ""),
    t "$",
  }),
  s(
    "toc",
    fmt(
      [[
  <!-- toc -->
  ]],
      {}
    )
  ),
}
ls.add_snippets("markdown", sni)
