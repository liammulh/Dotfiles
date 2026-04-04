-- ====================================================================
-- Set basic Neovim options.
-- ====================================================================

local opt = vim.opt

-- Configure tabs and indentation.
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Configure line numbers.
opt.number = true
opt.relativenumber = true

-- Configure search.
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Configure appearance.
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 15

-- Configure splits.
opt.splitright = true
opt.splitbelow = true

-- Configure file behavior.
opt.swapfile = false
opt.backup = false
opt.undofile = true

