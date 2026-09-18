-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Python: use basedpyright (superset of pyright) instead of the LazyVim default.
vim.g.lazyvim_python_lsp = "basedpyright"
-- Python: use ruff's native server for linting/formatting.
vim.g.lazyvim_python_ruff = "ruff"
-- Rust: let rust-analyzer own diagnostics (rather than bacon-ls).
vim.g.lazyvim_rust_diagnostics = "rust-analyzer"

-- TypeScript/JavaScript: use vtsls (mature, full refactor support).
-- Set to "tsc" for the newer, much faster native server.
vim.g.lazyvim_ts_lsp = "vtsls"
-- Prettier: only run when the project actually has a Prettier config file.
-- Prevents format-on-save from reformatting Django templates, Markdown and YAML
-- in repos that don't use Prettier.
vim.g.lazyvim_prettier_needs_config = true
