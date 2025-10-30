return {
   "nvimdev/dashboard-nvim",
   event = "VimEnter",
   -- cmd = "Dashboard",
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      local opts = {
         theme = "hyper",
         config = {
            week_header = {
               enable = true,
            },
            shortcut = {
               {
                  desc = " Buffer",
                  group = "Number",
                  action = function()
                     local util = require("core.util")
                     util.smart_bd()
                  end,
                  key = "q",
               },
               {
                  desc = " Files",
                  group = "Label",
                  action = "Telescope find_files",
                  key = "f",
               },
               {
                  desc = "󰊳 Update",
                  group = "@property",
                  action = "Lazy update",
                  key = "u",
               },
            },
            project = { enable = true, limit = 5 },
            mru = { enable = true, limit = 7 },
            footer = {
               "",
               "Fight scarcity with science and non-duality.",
               "Give to others. Ordinary is the way.",
            },
         },
         hide = {
            statusline = false,
         },
      }
      vim.opt.shortmess:append("I") -- disable Neovim welcome message
      require("dashboard").setup(opts)
   end,
}
