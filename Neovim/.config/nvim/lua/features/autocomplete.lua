-- ====================================================================
-- Set up autocomplete.
-- ====================================================================

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",   -- LSP source
    "hrsh7th/cmp-buffer",     -- buffer words source
    "hrsh7th/cmp-path",       -- filesystem paths source
    {
      "L3MON4D3/LuaSnip",     -- snippet engine (required by nvim-cmp)
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        -- Use arrow keys to move through the suggestion list.
        ["<Up>"]   = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

        -- Hit <tab> to accept the top (or currently selected) suggestion
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- If nothing is selected yet, select the first entry before confirming.
            if not cmp.get_selected_entry() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            end
            cmp.confirm({ select = false })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Use <shift>-<tab> to navigate backwards (keeps <shift>-<tab> useful inside cmp).
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        -- Use <ctrl>-<space> to manually trigger completion.
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Use <ctrl>-e to abort.
        ["<C-e>"] = cmp.mapping.abort(),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end,
}
