return {
   "lervag/vimtex",
   lazy = false,
   -- DO NOT lazy load, reverse search won't work
   -- Use init for configuration, don't use the more common "config", see
   -- https://github.com/lervag/vimtex?tab=readme-ov-file#installation
   init = function()
      vim.g.vimtex_view_method = "sioyek"
      -- The macOS app does not put sioyek on PATH
      local mac_sioyek = "/Applications/sioyek.app/Contents/MacOS/sioyek"
      if vim.fn.executable("sioyek") == 0 and vim.fn.executable(mac_sioyek) == 1 then
         vim.g.vimtex_view_sioyek_exe = mac_sioyek
      end
   end,
}
