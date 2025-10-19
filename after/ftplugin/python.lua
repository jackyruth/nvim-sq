-- 80/120 column markers
---@diagnostic disable-next-line: missing-fields
vim.opt_local.colorcolumn = { "80", "120" }

local util = require("core.util")
local keymaps = require("core.keymaps")
util.map_keys(keymaps.run_current_python, { buffer = true })
