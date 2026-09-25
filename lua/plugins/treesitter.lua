return {
   -- Tree-sitter: LSP syntax tree and better syntax highlighting
   {
      "nvim-treesitter/nvim-treesitter",
      -- TODO: migrate to 'main'
      tag = "v0.10.0", -- last version before master->main breaking changes
      event = { "BufReadPost", "BufNewFile" },
      cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
      build = ":TSUpdate",
      config = function()
         local configs = require("nvim-treesitter.configs")
         configs.setup({
            ensure_installed = {
               "c",
               "lua",
               "luadoc",
               "query",
               "vim",
               "norg",
               -- Required for in-buffer LaTeX rendering by render-markdown.nvim:
               -- "markdown_inline" provides the `$...$` inline math nodes,
               -- "latex" parses the formula bodies injected into them.
               "markdown",
               "markdown_inline",
               "latex",
               "vimdoc",
            },

            -- Install parsers synchronously (only applied to
            -- `ensure_installed`)
            sync_install = false,

            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            highlight = {
               enable = true,
               disable = {
                  "latex",
                  "tmux",
               },
            },

            indent = {
               enable = true,
            },

            incremental_selection = {
               enable = true,
               keymaps = require("core.keymaps").nvim_treesitter.keymaps,
            },

            modules = {},
            ignore_install = {},
         })
      end,
   },

   -- Tree-sitter: Current code context
   {
      "nvim-treesitter/nvim-treesitter-context",
      event = { "BufReadPost", "BufNewFile" },
      dependencies = { "nvim-treesitter/nvim-treesitter" },
   },
}
