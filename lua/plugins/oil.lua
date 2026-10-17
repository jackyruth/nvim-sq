return {
   "stevearc/oil.nvim",
   cmd = { "Oil" },
   opts = {
      silence_scp_warning = true, -- disable scp warnings
      default_file_explorer = false, -- do not disable Netrw
      view_options = {
         show_hidden = true,
      },
      keymaps = {
         -- like the global gx, so SVGs and notebooks open in their apps
         ["gx"] = {
            callback = function()
               local oil = require("oil")
               local entry = oil.get_cursor_entry()
               local dir = oil.get_current_dir()
               if entry and dir then
                  require("core.util").open_external(dir .. entry.name)
               end
            end,
            desc = "Open the entry in an external program",
         },
      },
   },
   -- Optional dependencies
   dependencies = { "nvim-tree/nvim-web-devicons" },
}
