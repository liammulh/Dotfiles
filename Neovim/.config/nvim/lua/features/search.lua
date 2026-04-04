-- ====================================================================
-- Sets up search windows.
-- ====================================================================

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Use native sorter for significantly better performance.
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,    -- whether to search for hidden files
          no_ignore = true, -- whether to search for files ignored by Git
        },
        find_files = {
          hidden = true,    -- whether to search for hidden files
          no_ignore = true, -- whether to search for files ignored by Git
        },
      },
    })

    -- Load fzf native sorter if available.
    pcall(telescope.load_extension, "fzf")
  end,
  keys = {
    {
      "<leader>ff",
      "<cmd>Telescope find_files<CR>",
      desc = "Open file search window",
    },
    {
      "<leader>fg",
      "<cmd>Telescope live_grep<CR>",
      desc = "Open grep window",
    },
  },
}
