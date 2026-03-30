vim.pack.add({
  -- Provides accurate, AST-based syntax highlighting and code understanding
  "https://github.com/nvim-treesitter/nvim-treesitter",
})

local treesitter = require("nvim-treesitter")

-- nvim-treesitter (main branch is a new rewrite) only manages parsers and queries;
-- highlighting is started via Neovim (`vim.treesitter.start()`).
treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
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
    pcall(vim.treesitter.start, args.buf)
  end,
})
