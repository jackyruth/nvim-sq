------------------------------------------------------------------------------
-- Neovide additional initialization, executed only by a Neovide session,
-- after all other initializations are performed

local util = require("core.util")

------------------------------------------------------------------------------
-- Neovide additional options
local options = require("neovide.options")
util.set_options(options)

------------------------------------------------------------------------------
-- Scale fonts up/down with <Command>= and <Command>-, respectively
local keymaps = require("neovide.keymaps")
util.map_all_keys(keymaps, { noremap = true, silent = true })

------------------------------------------------------------------------------
-- Set custom font
-- Should be set in $XDG_CONFIG_HOME/neovide/config.toml, see
-- https://neovide.dev/config-file.html#font
-- Alternatively, use, e.g.,
-- vim.cmd.set("guifont=JetBrainsMono\\ Nerd\\ Font:h14")

------------------------------------------------------------------------------
-- Set the current working directory to the home directory when launched
-- (most-likely) from a non-terminal session; hacky
-- TODO: eventually get rid of this
local current_dir = vim.fn.getcwd()
local home_dir = vim.uv.os_homedir()
if current_dir == "/" or current_dir == "C:\\Program Files\\Neovide" then
   if home_dir then
      vim.cmd("cd " .. vim.fn.fnameescape(home_dir))
   end
end

------------------------------------------------------------------------------
-- Enable copy/paste shortcuts on Mac, expect to be fixed in future versions
-- https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
vim.keymap.set("v", "<D-c>", '"+y') -- Copy
vim.keymap.set("n", "<D-v>", '"+P') -- Paste Normal mode
vim.keymap.set("v", "<D-v>", '"+P') -- Paste Visual mode
vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste Command mode
vim.keymap.set("i", "<D-v>", "<C-R>+") -- Paste Insert mode

------------------------------------------------------------------------------
---Jacky's custom configurations for neovide
---
if vim.g.neovide then
   -- Fallback chain: JetBrains Mono lacks the integral extensions (U+2320,
   -- U+2321, U+23AE) and U+1D715 that utftex emits when rendering math, and
   -- Neovide draws tofu instead of falling back the way a terminal does.
   -- Noto Sans Mono covers the box/integral pieces, DejaVu Math TeX Gyre the 𝜕.
   -- The same math font is registered as "TeX Gyre DejaVu Math" on macOS but
   -- as "DejaVu Math TeX Gyre" by fontconfig on Linux.
   local math_font = vim.fn.has("mac") == 1 and "TeX Gyre DejaVu Math"
      or "DejaVu Math TeX Gyre"
   vim.o.guifont = "JetBrainsMono Nerd Font,Noto Sans Mono," .. math_font .. ":h13"
   -- Per-machine display scaling: macmini (macOS) vs Ubuntu laptop
   vim.g.neovide_scale_factor = vim.fn.has("mac") == 1 and 1.5 or 0.5
end
