
-- base16 colors
-- Start flavours
require('base16-colorscheme').setup({
    base00 = '#262626', base01 = '#3a3a3a', base02 = '#4e4e4e', base03 = '#8a8a8a',
    base04 = '#949494', base05 = '#dab997', base06 = '#d5c4a1', base07 = '#ebdbb2',
    base08 = '#d75f5f', base09 = '#ff8700', base0A = '#ffaf00', base0B = '#afaf00',
    base0C = '#85ad85', base0D = '#83adad', base0E = '#d485ad', base0F = '#d65d0e',
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

