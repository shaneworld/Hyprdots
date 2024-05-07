---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
  hl_override = {
    CmpDoc = { bg = "NONE" },
    Comment = { fg = "grey" },
    ["@ibl.scope.underline.1"] = { bg = "#2f3549" },
  },
  transparency = true,
}

return M
