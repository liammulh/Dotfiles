-- ====================================================================
-- Sets up custom keymaps.
-- ====================================================================

local map = vim.keymap.set

-- Make it easier to navigate windows.
map("n", "<C-h>", "<C-w>h", { desc = "Switch window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch window right" })

-- Make it easier to switch between tabs.
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous tab" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next tab" })

-- Make it easier to resize tabs.
map("n", "<A-k>", ":resize +2<CR>")
map("n", "<A-j>", ":resize -2<CR>")
map("n", "<A-l>", ":vertical resize -2<CR>")
map("n", "<A-h>", ":vertical resize +2<CR>")

-- Make it easier to close tabs.
map("n", "<leader>c", "<cmd>bdelete<CR>", { desc = "Close tab" })
