-- Extra LSP tuning for Python, Rust, and Java, on top of the LazyVim lang extras.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Show inlay hints and codelens everywhere (LazyVim default, made explicit).
      inlay_hints = { enabled = true },
      codelens = { enabled = true },
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "standard",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                autoImportCompletions = true,
                -- "workspace" type-checks the whole project, but is slow on
                -- large repos. Switch if you want project-wide diagnostics.
                diagnosticMode = "openFilesOnly",
                inlayHints = {
                  variableTypes = true,
                  callArgumentNames = true,
                  functionReturnTypes = true,
                  genericTypes = true,
                },
              },
            },
          },
        },
      },
    },
  },

  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            -- Use clippy (not just cargo check) for on-save diagnostics.
            check = {
              command = "clippy",
              extraArgs = { "--all-targets", "--all-features" },
            },
            -- Full inlay hint set.
            inlayHints = {
              bindingModeHints = { enable = true },
              closureReturnTypeHints = { enable = "always" },
              closureCaptureHints = { enable = true },
              discriminantHints = { enable = "always" },
              expressionAdjustmentHints = { enable = "always" },
              genericParameterHints = {
                lifetime = { enable = true },
                type = { enable = true },
              },
              implicitDrops = { enable = true },
              lifetimeElisionHints = { enable = "always", useParameterNames = true },
              rangeExclusiveHints = { enable = true },
            },
            -- Code lens for runnables, impls, references.
            lens = {
              enable = true,
              implementations = { enable = true },
              references = {
                adt = { enable = true },
                enumVariant = { enable = true },
                method = { enable = true },
                trait = { enable = true },
              },
              run = { enable = true },
            },
            completion = {
              fullFunctionSignatures = { enable = true },
              callable = { snippets = "fill_arguments" },
            },
            hover = {
              actions = { enable = true, references = { enable = true } },
              memoryLayout = { niches = true },
            },
            semanticHighlighting = {
              operator = { specialization = { enable = true } },
              punctuation = { enable = true, specialization = { enable = true } },
            },
            -- Expand proc macros and build scripts for accurate analysis.
            procMacro = { enable = true },
            cargo = { buildScripts = { enable = true } },
          },
        },
      },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    opts = {
      settings = {
        java = {
          signatureHelp = { enabled = true, description = { enabled = true } },
          -- Code lens for references and implementations.
          referencesCodeLens = { enabled = true },
          implementationsCodeLens = { enabled = true },
          -- Pull library sources so go-to-definition shows real code, and
          -- fall back to a decompiler when sources aren't available.
          eclipse = { downloadSources = true },
          maven = { downloadSources = true },
          contentProvider = { preferred = "fernflower" },
          -- Suggest these static imports in completion (test assertions etc.).
          completion = {
            favoriteStaticMembers = {
              "org.junit.jupiter.api.Assertions.*",
              "org.junit.jupiter.api.Assumptions.*",
              "org.assertj.core.api.Assertions.*",
              "org.mockito.Mockito.*",
              "org.mockito.ArgumentMatchers.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
            },
          },
          -- Never collapse imports into wildcards.
          sources = {
            organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
          },
        },
      },
    },
  },
}
