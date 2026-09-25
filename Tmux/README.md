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
`Neovim/.config/nvim/lua/plugins/pane-navigation.lua`.

Since <ctrl>-l switches panes rather than clearing the screen, the
screen is cleared with <prefix> <ctrl>-l, where <prefix> is the
default <ctrl>-b.

Panes themselves are created with the tmux defaults: <prefix> % splits
the current pane vertically and <prefix> " splits it horizontally.

Pane Resizing
-----------------------------------------------------------------------

- <ctrl>-<shift>-h: move the pane border left
- <ctrl>-<shift>-j: move the pane border down
- <ctrl>-<shift>-k: move the pane border up
- <ctrl>-<shift>-l: move the pane border right

These keys need no prefix. Each press moves the border two cells, so
holding one down drags the border until the pane is the right size.

Terminals normally send <ctrl>-<shift>-h as the same byte as
<ctrl>-h, so tmux cannot tell them apart on its own. Alacritty is
configured to send these four keys as CSI u sequences, which tmux
understands because `extended-keys` is on. Under another terminal,
these keys will switch panes instead of resizing them.

Active Pane
-----------------------------------------------------------------------

The active pane is marked with a heavy border in the palette's yellow,
which zenbones renders as a rust brown. Inactive borders are the
palette's bright black, a step off the background in either direction.

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

The current window also sets `bg=colour0`, which does nothing under
either zenbones variant: colour0 and the terminal background are the
same color in both. It is there so the window still reads as active
under a theme whose black differs from its background. Bold versus
dim is what actually distinguishes the active window here.

Light and Dark
-----------------------------------------------------------------------

Every color in this file is a palette slot rather than hex. That is
deliberate, and it is the whole of tmux's involvement in switching
between the light and dark zenbones variants: tmux draws in whatever
the terminal maps colour0, colour2, colour3, colour7 and colour8 to,
so when Alacritty reloads its palette, tmux follows. Nothing reloads
tmux, and switching does not have to know it is running. See the Theme
section of the top-level `README.md`.

This is also why nothing here is pinned to a specific hex value, even
where a specific color is wanted. A hardcoded border color would
survive a switch unchanged and end up fighting the new background.
