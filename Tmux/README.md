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

Status Bar
-----------------------------------------------------------------------

The default tmux status bar is a solid green block with the session
name on the left and the pane title, date and time on the right. Mine
drops both ends, leaving just the window list on the left.

The current window is bold green. The others are dimmed, with the
window name in colour7 and the index and flags in colour2, so the
active window reads as brighter than its neighbors rather than being
marked with a highlight.

The colors here are palette slots rather than hex, unlike the pane
borders above. That is deliberate: the bar is drawn in whatever the
terminal maps colour0, colour2 and colour7 to, so it follows the theme
Alacritty is set to instead of pinning the bar to gruvbox.

The current window also sets `bg=colour0`, which does nothing under
gruvbox dark: colour0 and the terminal background are both #282828.
It is there so the window still reads as active under a theme whose
black differs from its background. Bold versus dim is what actually
distinguishes the active window here.
