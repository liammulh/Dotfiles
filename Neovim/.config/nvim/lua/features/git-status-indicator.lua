-- ====================================================================
-- Shows Git status indicators in the gutter and provides Git actions.
-- ====================================================================

return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navigation: ]c / [c jump between hunks, respecting diff mode.
      map("n", "]c", function()
        if vim.wo.diff then vim.cmd.normal({ "]c", bang = true })
        else gs.nav_hunk("next") end
      end, "Next git hunk")
      map("n", "[c", function()
        if vim.wo.diff then vim.cmd.normal({ "[c", bang = true })
        else gs.nav_hunk("prev") end
      end, "Previous git hunk")

      -- Set hunk actions.
      map("n", "<leader>gs",  gs.stage_hunk,                                          "Stage hunk")
      map("n", "<leader>gr",  gs.reset_hunk,                                          "Reset hunk")
      map("v", "<leader>gs",  function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stage hunk")
      map("v", "<leader>gr",  function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Reset hunk")
      map("n", "<leader>gS",  gs.stage_buffer,                                        "Stage buffer")
      map("n", "<leader>gR",  gs.reset_buffer,                                        "Reset buffer")
      map("n", "<leader>gu",  gs.undo_stage_hunk,                                     "Undo stage hunk")
      map("n", "<leader>gp",  gs.preview_hunk,                                        "Preview hunk")
      map("n", "<leader>gb",  function() gs.blame_line({ full = true }) end,          "Blame line")
      map("n", "<leader>gd",  gs.diffthis,                                            "Diff this")
      map("n", "<leader>gD",  function() gs.diffthis("~") end,                        "Diff this (against ~)")

      -- Set toggles.
      map("n", "<leader>gtb", gs.toggle_current_line_blame,                           "Toggle line blame")
      map("n", "<leader>gtd", gs.toggle_deleted,                                      "Toggle deleted")

      -- Select hunk with `ih` in operator/visual mode.
      map({ "o", "x" }, "ih", "<Cmd>Gitsigns select_hunk<CR>",                        "Select hunk")
    end,
  },
}
