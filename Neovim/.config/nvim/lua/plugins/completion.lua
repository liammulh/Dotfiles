return {
  -- Accept the highlighted completion item with <Tab>, the way VS Code
  -- and the JetBrains IDEs do it. LazyVim ships blink.cmp with the
  -- "enter" preset, where <Tab> only jumps snippet placeholders.
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "super-tab",
        -- The super-tab preset drops <CR>, so put it back.
        ["<CR>"] = { "accept", "fallback" },
      },
    },
  },
}
