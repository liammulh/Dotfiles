-- ====================================================================
-- Sets up a Netrw-style file explorer.
-- ====================================================================

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  opts = {
    filesystem = {
      filtered_items = {
        visible = true, -- show hidden files
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = {
        enabled = true,
      },
    },
    window = {
      position = "left",
      width = 30,
    },
  },
  keys = {
    {
      "<leader>e",
      "<cmd>Neotree toggle<CR>",
      desc = "Toggle file explorer",
    },
  },
}
