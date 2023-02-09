
-- base16 colors
-- Start flavours
require('base16-colorscheme').setup({
    base00 = '#1d2021', base01 = '#3c3836', base02 = '#504945', base03 = '#665c54',
    base04 = '#bdae93', base05 = '#d5c4a1', base06 = '#ebdbb2', base07 = '#fbf1c7',
    base08 = '#fb4934', base09 = '#fe8019', base0A = '#fabd2f', base0B = '#b8bb26',
    base0C = '#8ec07c', base0D = '#83a598', base0E = '#d3869b', base0F = '#d65d0e',
})
-- End flavours

-- vim.opt.termguicolors = true;

-- vim.cmd('colorscheme everforest')

-- disable dianostic column bg
-- vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')

-- bold & underline status line for active pane
-- vim.cmd('hi StatusLine cterm=bold,underline ctermbg=NONE gui=bold,underline guibg=NONE')

-- disable status line for inactive panes
-- vim.cmd('hi StatusLineNC cterm=NONE gui=NONE')

-- disable inverse vertsplit bar bg
-- vim.cmd('hi VertSplit cterm=NONE gui=NONE')

-- disable folded indicator bg
vim.cmd('hi Folded ctermbg=NONE guibg=NONE')

vim.cmd('hi clear TelescopeBorder')
vim.cmd('hi link TelescopeBorder VertSplit')

-- disable line number column bg
-- vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')

-- set minimal cursor line
-- vim.cmd('hi CursorLine ctermfg=NONE cterm=bold,underline ctermbg=NONE guifg=NONE gui=bold,underline guibg=NONE')

-- disable end of buffer tildas
-- vim.cmd('hi clear EndOfBuffer')
-- vim.cmd('hi link EndOfBuffer ColorColumn')

-- disable match paren bg
-- vim.cmd('hi MatchParen ctermbg=NONE guibg=NONE')

-- set NonText characters to a less noticable color
-- vim.cmd('hi NonText ctermfg=DarkGrey')

-- set indent line color
-- vim.cmd('hi clear IndentBlankLineChar')
-- vim.cmd('hi link IndentBlankLineChar NonText')

-- Comment
-- vim.cmd('hi clear Comment')
-- vim.cmd('hi link Comment LineNr')

-- Special
-- vim.cmd('hi clear Special')

-- Pmenu (popup menu)
-- vim.cmd('hi clear Pmenu')
-- vim.cmd('hi link Pmenu CursorLineFold')

