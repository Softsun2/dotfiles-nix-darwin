
-- base16 colors
-- Start flavours
require('base16-colorscheme').setup({
    base00 = '#1C2023', base01 = '#393F45', base02 = '#565E65', base03 = '#747C84',
    base04 = '#ADB3BA', base05 = '#C7CCD1', base06 = '#DFE2E5', base07 = '#F3F4F5',
    base08 = '#C7AE95', base09 = '#C7C795', base0A = '#AEC795', base0B = '#95C7AE',
    base0C = '#95AEC7', base0D = '#AE95C7', base0E = '#C795AE', base0F = '#C79595',
})
-- End flavours

-- vim.opt.termguicolors = true;

-- vim.cmd('colorscheme everforest')

-- disable dianostic column bg
-- vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')

-- bold & underline status line for active pane
-- vim.cmd('hi StatusLine cterm=bold,underline ctermbg=NONE gui=bold,underline guibg=NONE')

-- disable status line for inactive panes
vim.cmd('hi StatusLineNC cterm=NONE gui=NONE')

-- disable inverse vertsplit bar bg
-- vim.cmd('hi VertSplit cterm=NONE gui=NONE')

-- disable folded indicator bg
vim.cmd('hi Folded ctermbg=NONE guibg=NONE')

-- disable line number column bg
-- vim.cmd('hi LineNr ctermbg=NONE guibg=NONE')

-- set minimal cursor line
vim.cmd('hi CursorLine ctermfg=NONE cterm=bold,underline ctermbg=NONE guifg=NONE gui=bold,underline guibg=NONE')

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

