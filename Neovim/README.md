Neovim Config
=======================================================================

This is my Neovim configuration. It is built on
[LazyVim](https://www.lazyvim.org), which supplies the plugin set,
keymaps and sensible defaults. What lives here is only my own
additions and overrides on top of that, so this README describes what
I changed rather than everything LazyVim provides. For the defaults,
see the LazyVim keymap and plugin documentation.

Structure
-----------------------------------------------------------------------

```
.config/
|_nvim/
  |_init.lua
  |_lazy-lock.json
  |_lazyvim.json
  |_stylua.toml
  |_lua/
    |_config/
      |_autocmds.lua
      |_keymaps.lua
      |_lazy.lua
      |_options.lua
    |_plugins/
      |_colorscheme.lua
      |_completion.lua
      |_example.lua
      |_lang-lsp.lua
      |_pane-navigation.lua
```

`init.lua`, `lua/config/` and `example.lua` come from the LazyVim
starter template. `example.lua` is inert; it returns an empty spec and
is kept only as a reference for the spec syntax. `lazyvim.json` records
which LazyVim extras are enabled, and `lazy-lock.json` pins every
plugin to a specific commit, so both need to be committed.

Extras
-----------------------------------------------------------------------

These LazyVim extras are enabled, recorded in `lazyvim.json`:

- dap.core: debugging
- formatting.prettier
- linting.eslint
- lang.json, lang.python, lang.rust, lang.toml, lang.typescript

Customizations
-----------------------------------------------------------------------

### Options `lua/config/options.lua`

Picks which language servers the LazyVim language extras should use:
basedpyright and ruff for Python, rust-analyzer for Rust diagnostics,
and vtsls for TypeScript. Prettier is also restricted to projects that
actually contain a Prettier config file, which keeps format-on-save
from reformatting Django templates, Markdown and YAML in repositories
that do not use it.

### Color Scheme `lua/plugins/colorscheme.lua`

I use the gruvbox color scheme in dark mode with medium contrast, to
match my Alacritty colors.

### Completion `lua/plugins/completion.lua`

LazyVim ships blink.cmp with its "enter" keymap preset, where <cr>
accepts the highlighted completion item and <tab> only jumps between
snippet placeholders. I use blink's "super-tab" preset instead, so
<tab> accepts, which is what I am used to from VS Code and the
JetBrains IDEs. The preset drops <cr>, so I add it back and can use
either key. The first item in the menu is highlighted automatically;
that is a blink default, not something set here.

### Language Servers `lua/plugins/lang-lsp.lua`

Extra tuning on top of the Python and Rust extras. Both get a full set
of inlay hints and code lens. Python type checking is set to standard
mode over open files only, rather than the whole workspace, which is
slow on large repositories. Rust uses clippy for on-save diagnostics
instead of plain cargo check.

### Pane Navigation `lua/plugins/pane-navigation.lua`

I move between Neovim windows and tmux panes as though they were one
grid:

- <ctrl>-h: switch window or pane left
- <ctrl>-j: switch window or pane down
- <ctrl>-k: switch window or pane up
- <ctrl>-l: switch window or pane right
- <ctrl>-\: switch to the previous window or pane

When there is no Neovim window in the direction I press, Neovim hands
the key off to tmux, which moves to the neighboring pane instead. These
keymaps deliberately shadow the LazyVim defaults, which only move
between Neovim windows. The tmux half of this is in this repository's
tmux configuration, and the two halves have to agree, so change them
together.
