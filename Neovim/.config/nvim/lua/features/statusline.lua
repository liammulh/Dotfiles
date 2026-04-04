-- ====================================================================
-- Sets up a more attractive status line.
-- ====================================================================

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      theme = "gruvbox_dark",
      globalstatus = true, -- single statusline across all windows
      component_separators = { left = "", right = "" },
      section_separators   = { left = "", right = "" },

      -- Don't render lualine inside neo-tree or toggleterm windows;
      -- the extensions below handle those instead
      disabled_filetypes = {
        statusline = { "neo-tree", "toggleterm" },
      },
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        { "filename", path = 1 }, -- path=1 is relative path
        { "diagnostics", sources = { "nvim_lsp" } },
      },
      lualine_x = { "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },

    -- Extensions give neo-tree and toggleterm their own minimal statuslines
    -- instead of a blank bar.
    extensions = { "neo-tree", "toggleterm" },
  },
}
