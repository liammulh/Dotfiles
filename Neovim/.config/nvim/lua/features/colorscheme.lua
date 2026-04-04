-- ====================================================================
-- Sets up the Gruvbox color scheme.
-- ====================================================================

return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000, -- load before other plugins
  lazy = false,
  opts = {
    terminal_colors = true,
    contrast = "", -- "", "soft", or "hard"
    background = "dark",
  },
  config = function(_, opts)
    require("gruvbox").setup(opts)
    vim.o.background = "dark"
    vim.cmd("colorscheme gruvbox")
  end,
}
