-- noctua init.lua
-- require("noctua").setup({ variant = "lunch" })

local M = {}

M.defaults = {
  variant = "lunch",  -- "breakfast" | "lunch" | "dinner"
}

function M.setup(opts)
  opts = vim.tbl_deep_extend("force", M.defaults, opts or {})
  vim.cmd("colorscheme noctua-" .. opts.variant)
end

-- load() is used internally by the colors/ entry files
function M.load(variant)
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
  vim.g.colors_name  = "noctua-" .. variant
  vim.o.termguicolors = true
  vim.o.background   = variant == "breakfast" and "light" or "dark"

  local palettes   = require("noctua.palettes")
  local highlights = require("noctua.highlights")
  highlights.apply(palettes[variant], variant)
end

return M
