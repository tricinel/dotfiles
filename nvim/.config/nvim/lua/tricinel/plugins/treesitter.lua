vim.pack.add({
  -- Provides accurate, AST-based syntax highlighting and code understanding
  "https://github.com/nvim-treesitter/nvim-treesitter",
  -- Syntax aware text-objects
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  -- Shows the current function/class pinned at the top of the screen while scrolling
  "https://github.com/nvim-treesitter/nvim-treesitter-context"
})

local treesitter = require("nvim-treesitter")

-- nvim-treesitter (main branch is a new rewrite) only manages parsers and queries;
-- highlighting is started via Neovim (`vim.treesitter.start()`).
treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Enable treesitter-objects
require("nvim-treesitter-textobjects").setup()

-- Enable treesitter-context
require("treesitter-context").setup({
  enable = false,
  max_lines = 3,
  trim_scope = "outer",
  mode = "cursor"
})

local languages = {
  "typescript",
  "tsx",
  "javascript",
  "html",
  "css",
  "go",
  "lua",
  "dockerfile",
  "json5",
  "markdown",
  "markdown_inline",
}

-- Best-effort background install (no-op if already installed).
treesitter.install(languages)

-- Enable syntax highlighting everywhere there is a parser
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("tricinel-treesitter", { clear = true }),
  callback = function(args)
    if not pcall(vim.treesitter.get_parser, args.buf) then
      return
    end

    -- Start highlight
    pcall(vim.treesitter.start, args.buf)

    -- Enable context header for this buffer
    local tc = require("treesitter-context")
    tc.enable()

    local opts = { buffer = args.buf, silent = true }
    local map = vim.keymap.set
    local ts_select = require("nvim-treesitter-textobjects.select")
    local ts_move = require("nvim-treesitter-textobjects.move")

    -- Selecting
    map({ "x", "o" }, "af", function() ts_select.select_textobject("@function.outer", "textobjects") end, opts)
    map({ "x", "o" }, "if", function() ts_select.select_textobject("@function.inner", "textobjects") end, opts)

    -- Moving
    map({ "n", "x", "o" }, "]f", function() ts_move.goto_next_start("@function.outer", "textobjects") end,
      opts)
    map({ "n", "x", "o" }, "]F", function() ts_move.goto_next_end("@function.outer", "textobjects") end, opts)
    map({ "n", "x", "o" }, "[f", function() ts_move.goto_prev_start("@function.outer", "textobjects") end,
      opts)
    map({ "n", "x", "o" }, "[F", function() ts_move.goto_prev_end("@function.outer", "textobjects") end, opts)

    map("n", "[c", function() tc.go_to_context(vim.v.count1) end, opts)
  end,
})
