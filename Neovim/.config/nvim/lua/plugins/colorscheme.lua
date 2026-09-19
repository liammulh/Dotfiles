-- Zenbones, following the mode written to ~/.local/state/theme/mode.
-- See the Theme section of the repository README for the switching
-- mechanism as a whole.

local state_dir = (vim.env.XDG_STATE_HOME or (vim.env.HOME .. "/.local/state")) .. "/theme"
local mode_file = state_dir .. "/mode"

-- Kept at module scope so the watcher is not garbage collected while
-- it is still running.
local watcher = nil

-- Anything that is not exactly "light" counts as dark, so a missing or
-- truncated file falls back rather than throwing during startup.
local function read_mode()
  local file = io.open(mode_file, "r")
  if not file then
    return "dark"
  end
  local mode = file:read("l")
  file:close()
  return vim.trim(mode or "") == "light" and "light" or "dark"
end

-- Follow the mode file while Neovim is running, so that switching in
-- one pane repaints the editor in every other pane too. Changing
-- 'background' is enough: Neovim reloads the colorscheme on the
-- change, and zenbones reads 'background' rather than setting it.
--
-- The watch is on the directory, not on the file, because a watch on a
-- file is lost the moment that file is replaced rather than rewritten.
-- That means the sibling alacritty.toml also wakes us up, which is
-- harmless: assigning 'background' the value it already has does
-- nothing.
local function watch_mode()
  if watcher or not vim.uv.fs_stat(state_dir) then
    return
  end
  watcher = vim.uv.new_fs_event()
  if not watcher then
    return
  end
  watcher:start(
    state_dir,
    {},
    vim.schedule_wrap(function()
      vim.o.background = read_mode()
    end)
  )
end

return {
  -- Zenbones. Lush is optional, but without it the colorscheme runs in
  -- compatibility mode and its options are ignored.
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    priority = 1000,
  },

  -- Tell LazyVim to use it, in whichever mode is current.
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        vim.o.background = read_mode()
        vim.cmd.colorscheme("zenbones")
        watch_mode()
      end,
    },
  },
}
