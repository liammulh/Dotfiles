-- ====================================================================
-- Documents leader keymaps to be shown in a pop-up window.
-- ====================================================================

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    delay = 300, -- ms after pressing leader before the window appears
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Register descriptions for all leader keymaps.
    wk.add({
      { "<leader>c",   desc = "Close tab" },
      { "<leader>e",   desc = "Toggle file explorer" },
      { "<leader>t",   desc = "Toggle terminal drawer" },

      -- Search (under <leader>f)
      { "<leader>f",   group = "find" },
      { "<leader>ff",  desc = "Open file search window" },
      { "<leader>fg",  desc = "Open grep window" },

      -- Git (under <leader>g)
      { "<leader>g",   group = "git" },
      { "<leader>gs",  desc = "Stage hunk" },
      { "<leader>gr",  desc = "Reset hunk" },
      { "<leader>gS",  desc = "Stage buffer" },
      { "<leader>gR",  desc = "Reset buffer" },
      { "<leader>gu",  desc = "Undo stage hunk" },
      { "<leader>gp",  desc = "Preview hunk" },
      { "<leader>gb",  desc = "Blame line" },
      { "<leader>gd",  desc = "Diff this" },
      { "<leader>gD",  desc = "Diff this (against ~)" },
      { "<leader>gt",  group = "toggle" },
      { "<leader>gtb", desc = "Toggle line blame" },
      { "<leader>gtd", desc = "Toggle deleted" },
    })
  end,
}
