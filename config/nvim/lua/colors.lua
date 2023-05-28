-- start flavours
require('base16-colorscheme').setup({
    base00 = '#f7f7f7', base01 = '#e3e3e3', base02 = '#b9b9b9', base03 = '#ababab',
    base04 = '#525252', base05 = '#464646', base06 = '#252525', base07 = '#101010',
    base08 = '#7c7c7c', base09 = '#999999', base0A = '#a0a0a0', base0B = '#8e8e8e',
    base0C = '#868686', base0D = '#686868', base0E = '#747474', base0F = '#5e5e5e',
})
-- end flavours

vim.o.background = false
-- require('rose-pine').setup({
-- 	--- @usage 'auto'|'main'|'moon'|'dawn'
-- 	variant = 'main',
-- 	--- @usage 'main'|'moon'|'dawn'
-- 	dark_variant = 'main',
-- 	bold_vert_split = false,
-- 	dim_nc_background = false,
-- 	disable_background = true,
-- 	disable_float_background = false,
-- 	disable_italics = false,
-- 
-- 	--- @usage string hex value or named color from rosepinetheme.com/palette
-- 	groups = {
-- 		background = 'base',
-- 		background_nc = '_experimental_nc',
-- 		panel = 'surface',
-- 		panel_nc = 'base',
-- 		border = 'highlight_med',
-- 		comment = 'muted',
-- 		link = 'iris',
-- 		punctuation = 'subtle',
-- 
-- 		error = 'love',
-- 		hint = 'iris',
-- 		info = 'foam',
-- 		warn = 'gold',
-- 
-- 		headings = {
-- 			h1 = 'iris',
-- 			h2 = 'foam',
-- 			h3 = 'rose',
-- 			h4 = 'gold',
-- 			h5 = 'pine',
-- 			h6 = 'foam',
-- 		}
-- 		-- or set all headings at once
-- 		-- headings = 'subtle'
-- 	},
-- 
-- 	-- Change specific vim highlight groups
-- 	-- https://github.com/rose-pine/neovim/wiki/Recipes
-- 	highlight_groups = {
-- 		ColorColumn = { bg = 'rose' },
-- 
-- 		-- Blend colours against the "base" background
-- 		CursorLine = { bg = 'foam', blend = 10 },
-- 		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
-- 	}
-- })
-- 
-- -- Set colorscheme after options
-- vim.cmd('colorscheme rose-pine')
