
-- base16 colors
-- Start flavours
require('base16-colorscheme').setup({
    base00 = '#190b00', base01 = '#2d1400', base02 = '#401c00', base03 = '#542500',
    base04 = '#ffcba2', base05 = '#ffd6b6', base06 = '#ffe1ca', base07 = '#ffecdd',
    base08 = '#bc7c76', base09 = '#bc9476', base0A = '#c4a96e', base0B = '#a7b47e',
    base0C = '#7e98b4', base0D = '#a186ac', base0E = '#7eb4a3', base0F = '#c5c8c6',
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

