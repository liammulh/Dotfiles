-- ====================================================================
-- Sets up the terminal drawer.
-- ====================================================================

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    size = 15,
    direction = "horizontal",  -- drawer along the bottom
    start_in_insert = true,    -- enter insert mode automatically when opened
    persist_mode = true,       -- remember mode when toggling
  },
  keys = {
    -- Allow opening terminal while in normal mode in the editor.
    {
      "<leader>t",
      "<cmd>ToggleTerm<CR>",
      desc = "Toggle terminal drawer",
    },
    -- Press <esc> twice to enter normal mode while in the terminal.
    {
      "<Esc><Esc>",
      "<C-\\><C-n>",
      mode = "t",
      desc = "Enter normal mode in terminal",
    },
    -- Allow closing the terminal while in normal mode in the terminal.
    {
      "<leader>t",
      "<cmd>ToggleTerm<CR>",
      mode = "n",
      desc = "Toggle terminal drawer",
    },
  },
}
