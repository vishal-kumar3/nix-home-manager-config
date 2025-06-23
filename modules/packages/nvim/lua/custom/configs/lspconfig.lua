local config = require("plugins.configs.lspconfig")
local on_attach = config.on_attach
local capabilities = config.capabilities

-- Enhanced capabilities for nvim-cmp
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local lspconfig = require("lspconfig")

-- Custom on_attach function with better diagnostics
local custom_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  -- Enable inlay hints if supported
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end

  -- Set up buffer-local keymaps
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
end

-- List of servers to setup
local servers = {
  "html",
  "cssls",
  "tsserver",
  "pyright",
  "gopls",
  "nil_ls", -- Nix LSP
  "lua_ls",
  "marksman", -- Markdown
  "jsonls", -- JSON LSP
  "tailwindcss", -- Tailwind CSS
  "emmet_ls", -- Emmet for HTML/CSS/JSX
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = custom_on_attach,
    capabilities = capabilities,
  }
end

-- Go-specific configuration with enhanced settings
lspconfig.gopls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
        fieldalignment = true,
        nilness = true,
        unusedwrite = true,
        useany = true,
      },
      staticcheck = true,
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      buildFlags = {"-tags", "wireinject"},
      env = {
        GOFLAGS = "-tags=wireinject,integration",
      },
      directoryFilters = {
        "-.git",
        "-.vscode",
        "-.idea",
        "-.vscode-test",
        "-node_modules"
      },
    },
  },
}

-- Lua configuration for Neovim
lspconfig.lua_ls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- TypeScript/JavaScript configuration with React and Node.js support
lspconfig.tsserver.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      preferences = {
        importModuleSpecifier = "relative",
        includePackageJsonAutoImports = "auto",
      },
      suggest = {
        autoImports = true,
        completeFunctionCalls = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
      preferences = {
        importModuleSpecifier = "relative",
        includePackageJsonAutoImports = "auto",
      },
      suggest = {
        autoImports = true,
        completeFunctionCalls = true,
      },
    },
  },
}

-- Tailwind CSS LSP configuration
lspconfig.tailwindcss.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = {
    "html", "css", "scss", "javascript", "javascriptreact",
    "typescript", "typescriptreact", "vue", "svelte"
  },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)",
          "tw=\"([^\"]*)",
          "tw={\"([^\"}]*)",
          "tw\\.\\w+`([^`]*)",
          "tw\\(.*?\\)`([^`]*)",
          { "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          { "classnames\\(([^)]*)\\)", "'([^']*)'" },
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
        },
      },
      validate = true,
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning",
      },
    },
  },
}

-- Emmet LSP for HTML/CSS/JSX
lspconfig.emmet_ls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  filetypes = {
    "html", "css", "scss", "sass", "less",
    "javascript", "javascriptreact", "typescript", "typescriptreact"
  },
  settings = {
    emmet = {
      includeLanguages = {
        javascript = "javascriptreact",
        typescript = "typescriptreact",
      },
    },
  },
}

-- Enhanced Python configuration with better Node.js integration
lspconfig.pyright.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        autoImportCompletions = true,
        diagnosticMode = "workspace",
        stubPath = "typings",
      },
      linting = {
        enabled = true,
      },
    },
  },
}

-- JSON LSP
lspconfig.jsonls.setup {
  on_attach = custom_on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
