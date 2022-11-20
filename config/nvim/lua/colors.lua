
-- base16 colors
-- Start flavours
-- require('base16-colorscheme').setup({
--     base00 = '#2f383e', base01 = '#374247', base02 = '#4a555b', base03 = '#859289',
--     base04 = '#9da9a0', base05 = '#d3c6aa', base06 = '#e4e1cd', base07 = '#fdf6e3',
--     base08 = '#7fbbb3', base09 = '#d699b6', base0A = '#dbbc7f', base0B = '#83c092',
--     base0C = '#e69875', base0D = '#a7c080', base0E = '#e67e80', base0F = '#eaedc8',
-- })
-- End flavours

vim.opt.termguicolors = true;

vim.cmd('colorscheme everforest')

-- disable dianostic column bg
-- vim.cmd('hi SignColumn ctermbg=NONE guibg=NONE')

-- bold & underline status line for active pane
-- vim.cmd('hi StatusLine cterm=bold,underline ctermbg=NONE gui=bold,underline guibg=NONE')

-- disable status line for inactive panes
-- vim.cmd('hi StatusLineNC cterm=NONE gui=NONE')

-- disable inverse vertsplit bar bg
-- vim.cmd('hi VertSplit cterm=NONE gui=NONE')

-- disable folded indicator bg
-- vim.cmd('hi Folded ctermbg=NONE guibg=NONE')

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

