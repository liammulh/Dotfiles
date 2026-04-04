-- ====================================================================
-- Allows viewing buffers as tabs at the top of the screen.
-- ====================================================================

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  opts = {
    options = {
      -- Don't show neo-tree or toggleterm buffers as tabs.
      offsets = {
        {
          filetype = "neo-tree",
          text = "Files",
          highlight = "Directory",
          separator = true,
        },
      },
      filter = function(buf, _)
        local ft = vim.bo[buf].filetype
        -- Exclude terminal and neo-tree buffers from the tabline.
        return ft ~= "toggleterm" and ft ~= "neo-tree"
      end,

      show_buffer_close_icons = true,
      show_close_icon = false,
      separator_style = "thin",
      always_show_bufferline = true,
    },
  },
}
