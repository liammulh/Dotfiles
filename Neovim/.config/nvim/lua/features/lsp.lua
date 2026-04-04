-- ====================================================================
-- Configures LSP.
-- ====================================================================

return {
  {
    -- Mason installs LSP servers automatically.
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    -- Ensures servers are installed; enables them via vim.lsp.
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" },
        -- For each installed server, enable it.
        handlers = {
          function(server_name)
            vim.lsp.enable(server_name)
          end,
        },
      })

      -- Attach keymaps when any LSP server connects to a buffer.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          map("gd", vim.lsp.buf.definition,       "Go to definition")
          map("gD", vim.lsp.buf.declaration,      "Go to declaration")
          map("gr", vim.lsp.buf.references,       "Go to references")
          map("K",  vim.lsp.buf.hover,            "Hover documentation")
          map("<leader>rn", vim.lsp.buf.rename,   "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        end,
      })
    end,
  },
}
