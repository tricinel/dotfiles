vim.pack.add({
  -- Allows automatic installation of language servers
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup({
  ui = {
    check_outdated_packages_on_open = true,
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

-- Get default capabilities for LSP (includes completion support from blink.cmp)
local capabilities = require("blink.cmp").get_lsp_capabilities()

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json" },
})

-- Oxc (formatting + linting via LSP mode)
vim.lsp.config("oxfmt", {
  capabilities = capabilities,
  cmd = { "oxfmt", "--lsp" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
})

vim.lsp.config("oxlint", {
  capabilities = capabilities,
  cmd = { "oxlint", "--lsp" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
})

-- HTML
vim.lsp.config("html", {
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { "package.json" },
})

-- CSS
vim.lsp.config("cssls", {
  capabilities = capabilities,
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json" },
})

-- Tailwind CSS
vim.lsp.config("tailwindcss", {
  capabilities = capabilities,
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "tailwind.config.js", "tailwind.config.ts", ".git" },
})

-- Go
vim.lsp.config("gopls", {
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.mod", "go.work" },
  settings = {
    gopls = {
      gofumpt = true, -- Use gofmt/goimports for formatting
    },
  },
})

-- Lua
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", "stylua.toml" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },      -- Neovim uses LuaJIT
      diagnostics = { globals = { "vim" } }, -- Recognize vim global
      telemetry = { enable = false },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
})

-- JSON
vim.lsp.config("jsonls", {
  capabilities = capabilities,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { "package.json" },
})

-- Markdown (Marksman)
vim.lsp.config("marksman", {
  capabilities = capabilities,
  cmd = { "marksman", "server" },
  filetypes = { "markdown", "markdown.mdx" },
  root_markers = { ".git", ".marksman.toml" },
})

-- Auto install the lsp servers
require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "oxfmt",
    "oxlint",
    "html",
    "cssls",
    "tailwindcss",
    "gopls",
    "lua_ls",
    "jsonls",
    "marksman",
  },
})

vim.keymap.set("n", "<leader>vm", "<cmd>Mason<cr>", { desc = "Mason" })
