local opt = vim.opt

-- Basic settings
opt.number = true         -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.cursorline = true     -- Highlight current line
opt.wrap = false          -- Don't wrap lines
opt.scrolloff = 10        -- Keep 10 lines above/below cursor
opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor

-- Indentation
opt.tabstop = 2        -- Tab width
opt.shiftwidth = 2     -- Indent width
opt.softtabstop = 2    -- Soft tab stop
opt.expandtab = true   -- Use spaces instead of tabs
opt.smartindent = true -- Smart auto-indenting
opt.autoindent = true  -- Copy indent from current line

-- Search settings
opt.ignorecase = true -- Case insensitive search
opt.smartcase = true  -- Case sensitive if uppercase in search
opt.hlsearch = false  -- Don't highlight search results
opt.incsearch = true  -- Show matches as you type

-- Visual settings
opt.termguicolors = true                      -- Enable 24-bit colors
opt.signcolumn = "auto:1-3"                   -- Always show sign column
opt.colorcolumn = "100"                       -- Show column at 100 characters
opt.showmatch = true                          -- Highlight matching brackets
opt.matchtime = 2                             -- How long to show matching bracket
opt.cmdheight = 1                             -- Command line height
opt.completeopt = "menuone,noinsert,noselect" -- Completion options
opt.showmode = false                          -- Don't show mode in command line
opt.pumheight = 10                            -- Popup menu height
opt.pumblend = 10                             -- Popup menu transparency
opt.winblend = 0                              -- Floating window transparency
opt.conceallevel = 0                          -- Don't hide markup
opt.concealcursor = ""                        -- Don't hide cursor line markup
opt.synmaxcol = 300                           -- Syntax highlighting limit
opt.fillchars = { eob = " " }                 -- Hide ~ on empty lines
opt.winborder = "rounded"                     -- Rounded border for floating windows
opt.winbar = "%=%m %f"                        -- ???

-- Create undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.vim/undodir")
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- File handling
opt.backup = false                            -- Don't create backup files
opt.writebackup = false                       -- Don't create backup before writing
opt.swapfile = false                          -- Don't create swap files
opt.undofile = true                           -- Persistent undo
opt.undodir = vim.fn.expand("~/.vim/undodir") -- Undo directory
opt.updatetime = 300                          -- Faster completion
opt.timeoutlen = 500                          -- Key timeout duration
opt.ttimeoutlen = 0                           -- Key code timeout
opt.autoread = true                           -- Auto reload files changed outside vim
opt.autowrite = false                         -- Don't auto save

-- Behavior settings
opt.errorbells = false                                         -- No error bells
opt.backspace = "indent,eol,start"                             -- Better backspace behavior
opt.autochdir = false                                          -- Don't auto change directory
opt.iskeyword:append("-")                                      -- Treat dash as part of word
opt.path:append("**")                                          -- include subdirectories in search
opt.selection = "exclusive"                                    -- Selection behavior
opt.mouse = "a"                                                -- Enable mouse support
opt.clipboard = vim.env.SSH_CONNECTION and "" or "unnamedplus" -- Sync with system clipboard
opt.modifiable = true                                          -- Allow buffer modifications
opt.encoding = "UTF-8"                                         -- Set encoding
opt.jumpoptions = "view"                                       -- Restore scrolloff + cursor position
opt.laststatus = 3                                             -- global statusline
opt.smoothscroll = true                                        -- Smooth animated scrolling instead of jumping line-by-line

-- Buffer settings
opt.inccommand = "nosplit" -- preview incremental substitute
opt.shortmess:append({ W = true, I = true, c = true, C = true })

-- Cursor settings
opt.guicursor = table.concat({
  "n-v-c:block",                                       -- Normal, Visual, Command: Solid block
  "i-ci-ve:block-blinkwait700-blinkoff400-blinkon250", -- Insert: Block with blink
  "r-cr:hor20",                                        -- Replace: Horizontal bar
  "o:hor50",                                           -- Operator-pending: Horizontal bar
  "sm:block-blinkwait175-blinkoff150-blinkon175",      -- Showmatch: Block with fast blink
}, ",")

opt.splitbelow = false -- Don't put new windows below current
opt.splitright = true  -- Use right splits

-- Performance improvements
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- Tab display settings
opt.showtabline = 2 -- Always show tabline (0=never, 1=when multiple tabs, 2=always)
opt.tabline = ""    -- Use default tabline (empty string uses built-in)

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Could be '■', '▎', 'x'
    spacing = 4,
    source = "if_many", -- Shows the source (e.g., "lua_ls" or "eslint")
  },
  float = {
    border = "rounded",
    source = "always",
  },
  signs = true,             -- Shows icons in the gutter
  underline = true,
  update_in_insert = false, -- Don't distract while typing
  severity_sort = true,
})

-- Command-line completion
opt.wildmenu = true
opt.wildmode = "longest:full,full"
opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })

-- Replace default grep with ripgrep
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
