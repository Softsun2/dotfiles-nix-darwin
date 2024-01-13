local opt = vim.opt
local wo = vim.wo
local g = vim.g
local o = vim.o

-- Ui
wo.number = true                -- line numbers
wo.relativenumber = true        -- relative line numbers
wo.wrap = false                 -- no wrap
opt.cursorline = true
opt.colorcolumn = "80"
opt.pumheight = 10              -- maximum number of lines a popup can span

-- History
opt.swapfile = false
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.cache"

-- Indentation
opt.autoindent = true           -- copy current indent level when starting a new line
opt.tabstop = 4                 -- number of spaces a tab when tabbing
opt.shiftwidth = 4              -- denotes width of a level of indentation
opt.expandtab = true            -- tab with spaces

-- folding
-- opt.foldenable = false          -- open all folds upon entering a file

-- splitting
-- o.splitright = true
-- o.splitbelow = true

-- Misc
opt.ignorecase = true           -- ignore case when searching
opt.smartcase = true            -- only ignore case if all lowercase
opt.autoread = true             -- reread file if external changes are made to such file
opt.incsearch = true

-- disable this abomination
g.omni_sql_no_default_maps = 1
