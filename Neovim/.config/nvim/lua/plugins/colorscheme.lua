return {
  -- Gruvbox colorscheme, loaded early so it is available at startup.
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
      contrast = "", -- "hard" | "soft" | "" for medium
    },
  },

  -- Tell LazyVim to use it, in dark mode.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruvbox")
      end,
    },
  },
}
