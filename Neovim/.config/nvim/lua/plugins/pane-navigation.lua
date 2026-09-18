return {
  -- Move between Neovim windows and tmux panes with the same keys, as
  -- though they were one grid. Pairs with the bindings in
  -- ~/.config/tmux/tmux.conf.
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    init = function()
      -- Define the keymaps below rather than using the plugin defaults.
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Go to Left Window/Pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Go to Lower Window/Pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Go to Upper Window/Pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Go to Right Window/Pane" },
      { "<C-\\>", "<cmd>TmuxNavigatePrevious<cr>", desc = "Go to Previous Window/Pane" },
    },
  },
}
