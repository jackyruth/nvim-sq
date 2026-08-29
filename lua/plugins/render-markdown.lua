return {
   "MeanderingProgrammer/render-markdown.nvim",
   dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
   -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
   -- dependencies = {
   --    "nvim-treesitter/nvim-treesitter",
   --    "nvim-tree/nvim-web-devicons",
   -- }, -- if you prefer nvim-web-devicons
   ft = { "markdown" },
   keys = require("core.keymaps").render_markdown.keys,
   ---@module 'render-markdown'
   ---@type render.md.UserConfig
   opts = {
      -- Renders `$...$` and `$$...$$` as unicode math directly in the buffer.
      -- Needs an external converter on $PATH, tried in order:
      --   utftex    -> 2D layout (stacked fractions, real integral signs),
      --                built from https://github.com/bartp5/libtexprintf
      --   latex2text -> linear fallback, `uv tool install pylatexenc`
      -- Without one the handler silently renders nothing.
      latex = {
         enabled = true,
         converter = { "utftex", "latex2text" },
         highlight = "RenderMarkdownMath",
         -- Single-line formulas render in place of the source; multi-line
         -- `$$` blocks automatically fall back to rendering above the block.
         position = "center",
         top_pad = 0,
         bottom_pad = 0,
      },
   },
}
