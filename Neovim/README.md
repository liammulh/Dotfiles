Neovim Config
=======================================================================

This is my Neovim configuration. Since plugins change all the time, I
thought I'd describe the features of my configuration in an abstract
way. I try to keep the configuration as minimal and modular as
possible.

Structure
-----------------------------------------------------------------------

```
.config/
|_nvim/
  |_init.lua
  |_lua/
    |_keymaps.lua
    |_options.lua
    |_features/
      |_autocomplete.lua
      |_colorscheme.lua
      |_file-explorer.lua
      |_git-status-indicator.lua
      |_keymap-info-window.lua
      |_lsp.lua
      |_search.lua
      |_statusline.lua
      |_tabs.lua
      |_terminal-drawer.lua
```

Basics
-----------------------------------------------------------------------

### Keymaps `keymaps.lua`

To more easily switch between windows, I've set up these keymaps:

- <ctrl>-h: switch window left
- <ctrl>-j: switch window down
- <ctrl>-k: switch window up
- <ctrl>-l: switch window right

To easily switch tabs:

- <shift>-h: switch to the left tab
- <shift>-l: switch to the right tab

To resize windows:

- <alt>-h: increase size to the left
- <alt>-j: increase size down
- <alt>-k: increase size up
- <alt>-l: increase size to the right

To close a tab:

- <space>-c: close the current tab

### Options `options.lua`

Contains basic Neovim options.

Features
-----------------------------------------------------------------------

### Autocomplete `autocomplete.lua`

I have auto-suggestions (LSP) set up for the following programming
languages:

- Python

When the window with auto-suggestions pops up, I can hit <tab> to accept
the top suggestion, and I can use the arrow keys to move up and down in
the list of auto-suggestions.

### Color Scheme `colorscheme.lua`

I use the popular Gruvbox color scheme. I use the dark variant.

### File Explorer `file-explorer.lua`

The file explorer lists files and directories relative to the directory
where Neovim was opened. It shows hidden files.

### Git Status Indicator `git-status-indicator.lua`

Shows Git change indicators (added, modified, removed lines) in the
gutter. All keymaps use <space>-g as a prefix.

Navigation:

- ]c: next hunk
- [c: previous hunk

Hunk actions:

- <space>-g-s: stage hunk
- <space>-g-r: reset hunk
- <space>-g-S: stage buffer
- <space>-g-R: reset buffer
- <space>-g-u: undo stage hunk
- <space>-g-p: preview hunk
- <space>-g-b: blame line
- <space>-g-d: diff this
- <space>-g-D: diff this against ~

Toggles:

- <space>-g-t-b: toggle current line blame
- <space>-g-t-d: toggle deleted

Text object:

- ih: select hunk (operator and visual mode)

### Keymap Info Window `keymap-info-window.lua`

When I press the leader key (the space key), I see a window that shows
my custom keymaps:

- <space>-c: close the current tab
- <space>-e: opens and closes the file explorer
- <space>-t: toggles the terminal drawer
- <space>-f-f: opens the file search window
- <space>-f-g: opens the grep window
- <space>-g: git actions

### Language Server Protocol `lsp.lua`

Configures LSP using Mason to automatically install language servers.
Uses Neovim's native LSP API. Currently configured for Python (pyright).

### Search Windows `search.lua`

- <space>-f-f: opens a fuzzy file search window.
- <space>-f-g: opens a grep window for recursively searching files.

### Status Line `statusline.lua`

Configures a more attractive status line compatible with the color
scheme.

### Tabs `tabs.lua`

When a file is opened, it opens in a new tab.

### Terminal Drawer `terminal-drawer.lua`

The terminal drawer can be popped open and closed and maintains its
state. Its directory is inherited from the directory where Neovim was
opened. When the terminal is opened, it starts in insert mode. Pressing
escape twice exits insert mode and enters normal mode, from which the
terminal can be toggled shut with <space>-t.
