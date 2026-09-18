Tmux Config
=======================================================================

This is my tmux configuration. It is deliberately minimal. It uses vi
keys in copy mode and makes pane navigation match the window
navigation in my Neovim configuration.

Structure
-----------------------------------------------------------------------

```
.config/
|_tmux/
  |_tmux.conf
```

Pane Navigation
-----------------------------------------------------------------------

- <ctrl>-h: switch pane left
- <ctrl>-j: switch pane down
- <ctrl>-k: switch pane up
- <ctrl>-l: switch pane right
- <ctrl>-\: switch to the previous pane

These keys need no prefix. When the active pane is running Vim or
Neovim, the key is forwarded to the editor instead so that it can move
between its own windows first. Once the editor runs out of windows in
that direction, it tells tmux to switch panes, so windows and panes
behave like one continuous grid. The editor half of this is the
vim-tmux-navigator plugin, configured in
`Neovim/.config/nvim/lua/features/pane-navigation.lua`.

Since <ctrl>-l switches panes rather than clearing the screen, the
screen is cleared with <prefix> <ctrl>-l, where <prefix> is the
default <ctrl>-b.

Panes themselves are created with the tmux defaults: <prefix> % splits
the current pane vertically and <prefix> " splits it horizontally.

Active Pane
-----------------------------------------------------------------------

The active pane is marked with a heavy border in gruvbox orange.
Inactive borders are a muted gray.

Alacritty is configured to blink the cursor, which is a second cue:
the pane with the blinking cursor is the active one.
