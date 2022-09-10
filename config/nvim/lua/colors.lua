local o = vim.opt

-- Use or don't use terminal colors, depends on theme
o.termguicolors = true

-- disable dianostic column bg
vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')

-- bold & underline status line for active pane
-- vim.cmd('hi StatusLine ctermfg=NONE ctermbg=NONE cterm=bold,underline guifg=NONE guibg=NONE gui=bold,underline')

-- disable status line for inactive panes
-- vim.cmd('hi clear StatusLineNC')

-- disable inverse vertsplit bar bg
-- vim.cmd('hi VertSplit cterm=NONE ctermbg=NONE gui=NONE guibg=NONE')

-- disable folded indicator bg
vim.cmd('hi Folded ctermbg=NONE guibg=NONE')

-- disable line number column bg
vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')

-- set minimal cursor line
vim.cmd('hi CursorLine ctermbg=NONE ctermfg=NONE cterm=bold,underline guibg=NONE guifg=NONE gui=bold,underline')

-- set indent line color
-- vim.cmd('hi clear IndentBlankLineChar')
-- vim.cmd('hi link IndentBlankLineChar Comment')

-- disable end of buffer tildas
vim.cmd('hi clear EndOfBuffer')
vim.cmd('hi link EndOfBuffer Ignore')

-- disable match paren bg
-- vim.cmd('hi MatchParen ctermbg=NONE guibg=NONE')

-- set NonText characters to a less noticable color
vim.cmd('hi clear NonText')
vim.cmd('hi link NonText Comment')

-- set root folder color to
vim.cmd('hi clear NvimTreeRootFolder')
vim.cmd('hi link NvimTreeRootFolder Todo')

vim.cmd('hi Normal guibg=NONE')
