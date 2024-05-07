require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>")
map("n", "<leader>t", ":TodoTelescope<cr>")

map({"n", "v"}, "H", "0")
map({"n", "v"}, "L", "$")
-- map({"n", "v"}, "J", "5j")
-- map({"n", "v"}, "K", "5k", opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
