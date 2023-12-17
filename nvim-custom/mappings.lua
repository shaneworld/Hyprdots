---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["H"] = { "^", "go to the start of the line" },
    ["L"] = { "$", "go to the end of the line" },
  },
  v = {
    [">"] = { ">gv", "indent"},
    ["H"] = { "^", "go to the start of the line" },
    ["L"] = { "$", "go to the end of the line" },
  },
  i = {
    ["hh"] = { "<esc>", "normal mode" }
  }
}

-- more keybinds!

return M
